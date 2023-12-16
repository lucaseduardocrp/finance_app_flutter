class Validator {
  Validator._();

  static String? validatedName(String? name){    
    if(name != null && name.isEmpty){
      return 'The names field is required';
    }
    
    return null;               
  }

  static String? validatedEmail(String? email){
    final condition = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
    );

    if(email != null && email.isEmpty){
      return 'The email field is required';
    }

    if(email != null && !condition.hasMatch(email)){
      return 'This Email is invalid. Please enter another email!';
    }
    return null;               
  }

  static String? validatedPassword(String? password){
    final condition = RegExp(r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");

    if(password != null && password.isEmpty){
      return 'The password field is required';
    }
 
    if(password != null && !condition.hasMatch(password)){
      return 'This password is invalid. Is necessary 8 characters and includes a uppercase letter, lowercase letter and a especial char!';
    }

    return null;               
  }

  static String? validatedConfirmPassword(String? password, String? comparePassword){

    if(password != comparePassword){
      return 'The passwords is different. Please, correct the your password!';
    }

    return null;               
  }
}