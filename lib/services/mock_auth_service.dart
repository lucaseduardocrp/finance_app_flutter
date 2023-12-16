import 'package:finance_app/common/models/user_model.dart';
import 'package:finance_app/services/auth_service.dart';

class MockAuthService implements AuthService {
  
  @override
  Future signIn(){
    throw UnimplementedError();
  }
  
  @override
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      if(password.startsWith('123')){
        throw UnimplementedError();
      }

      return UserModel(
        id: email.hashCode,
        name: name,
        email: email,
        password: password
      );
    } catch (e) {
      if(password.startsWith('123')){
        throw 'Senha insegura. Tente uma nova senha';
      }
      throw 'Não foi possível criar sua conta nesse momento. Tente mais tarde.';
    }
  }
}