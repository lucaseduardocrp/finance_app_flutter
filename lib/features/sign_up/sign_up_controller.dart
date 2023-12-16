import 'dart:developer';

import 'package:finance_app/features/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';

class SignUpController extends ChangeNotifier {
  SignUpState state = SignUpInitialState();

  void changeState(SignUpState newState){
    state = newState;
    notifyListeners();
  }

  Future<bool> doSignUp() async {
    changeState(SignUpLoadingState());
    
    try {
      await Future.delayed(const Duration(seconds: 2));

      throw Exception('Erro ao logar');
      log('Usuário logado');
      
      changeState(SignUpSuccessState());
      return true;
    } catch (e) {
      changeState(SignUpErrorState());
      return false;
    }
    
  }
}