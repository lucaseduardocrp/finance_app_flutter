/* eslint-disable max-len */
/* eslint-disable no-unused-vars */
const functions = require("firebase-functions");
const admin = require("firebase-admin");
const request = require("graphql-request");

const client = new request.GraphQLClient("https://steady-elf-53.hasura.app/v1/graphql", {
  headers: {
    "content-type": "application/json",
    "x-hasura-admin-secret": "KKCaLKFvrQdwGhvfFZiEJLhKCPxLYD3l4zKc7jT2r9B2PfjIU9ftw5s4nL3C61K2",
  },
});

admin.initializeApp(functions.config().firebase);
exports.registerUser = functions.https.onCall(async (data, context) => {
  const email = data.email;
  const password = data.password;
  const displayName = data.displayName;

  if (email === null || password === null || displayName === null) {
    throw new functions.https.HttpsError("signup-failed", "missing information");
  }

  try {
    const userRecord = await admin.auth().createUser({
      email: data.email,
      password: data.password,
      displayName: data.displayName,
    });

    const customClaims = {
      "https://hasura.io/jwt/claims": {
        "x-hasura-default-role": "user",
        "x-hasura-allowed-role": ["user"],
        "x-hasura-user-id": userRecord.uid,
      },
    };

    await admin.auth().setCustomUserClaims(userRecord.uid, customClaims);
    return userRecord.toJSON();
  } catch (error) {
    throw new functions.https.HttpsError("signup-failed", JSON.stringify(error, undefined, 2));
  }
});

exports.processSignUp = functions.auth.user().onCreate(async (user) => {
  const id = user.uid;
  const email = user.email;
  const name = user.displayName || "No Name";

  if (id == null || email == null || name == null) {
    throw new functions.https.HttpsError("sync-failed", "missing information");
  }

  const mutation = `mutation($id: String!, $email: String, $name: String) {
      insert_user(objects: [{
          id: $id,
          email: $email,
          name: $name,
        }]) {
          affected_rows
        }
      }`;

  try {
    const data = await client.request(mutation, {
      id: id,
      email: email,
      name: name,
    });

    return data;
  } catch (error) {
    console.error("Error processing sign up:", error);
    throw new functions.https.HttpsError("internal", "Error processing sign up.");
  }
});

// em caso de remoção do usuário, essa função será executada e realizará a deleção do usuário no banco
exports.processDelete = functions.auth.user().onDelete(async (user) => {
  const mutation = `mutation($id: String!) {
      delete_user(where: {id: {_eq: $id}}) {
        affected_rows
      }
  }`;

  const id = user.uid;

  try {
    const data = await client.request(mutation, {
      id: id,
    });
    return data;
  } catch (error) {
    console.error("Error processing delete:", error);
    throw new functions.https.HttpsError("internal", "Error processing delete.");
  }
});

// em caso de atualização do nome usuário, essa função será executada e realizará a atualização no banco
exports.updateUserName = functions.https.onCall(async (data) => {
  const id = data.id;
  const name = data.name;

  if (id == null || name == null) {
    throw new functions.https.HttpsError("update-failed", "missing information");
  }

  const mutation = `mutation($id: String!, $name: String!) {
      update_user(where: {id: {_eq: $id}}, _set: {name: $name}) {
        affected_rows
      }
    }`;

  try {
    const data = await client.request(mutation, {
      id: id,
      name: name,
    });
    return data;
  } catch (error) {
    console.error("Error processing update user name:", error);
    throw new functions.https.HttpsError("internal", "Error processing user name.");
  }
});
