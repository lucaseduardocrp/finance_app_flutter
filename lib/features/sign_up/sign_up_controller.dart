import 'package:finance_app/features/sign_up/sign_up_state.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  final AuthService _service;

  SignUpController(this._service);

  SignUpState state = SignUpInitialState();

  void changeState(SignUpState newState){
    state = newState;
    notifyListeners();
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password
  }) async {
    changeState(SignUpLoadingState());
    
    try {
      await _service.signUp(
        name: name,
        email: email,
        password: password
      );

      changeState(SignUpSuccessState());
    } catch (e) {
      changeState(SignUpErrorState(e.toString()));
    }
  }
}