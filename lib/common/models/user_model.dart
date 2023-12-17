class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;

  UserModel({
    this.name,
    required this.id,
    required this.email,
    required this.password
  });
}