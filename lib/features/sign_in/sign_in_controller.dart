import 'package:finance_app/features/sign_in/sign_in_state.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;

  SignInController(this._service);

  SignInState state = SignInInitialState();

  void changeState(SignInState newState){
    state = newState;
    notifyListeners();
  }

  Future<void> signIn({
    String? name,
    required String email,
    required String password
  }) async {
    changeState(SignInLoadingState());
    
    try {
      await _service.signIn(
        email: email,
        password: password
      );

      changeState(SignInSuccessState());
    } catch (e) {
      changeState(SignInErrorState(e.toString()));
    }
  }
}