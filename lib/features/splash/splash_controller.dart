import 'package:finance_app/features/splash/splash_state.dart';
import 'package:finance_app/services/secure_storage.dart';
import 'package:flutter/cupertino.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;
  SplashController(this._service);

  SplashState state = SplashInitialState();

  void changeState(SplashState newState){
    state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    await Future.delayed(const Duration(seconds: 1));

    final result = await _service.readOne(key: "CURRENT_USER");

    if(result != null){
      changeState(SplashSuccessState());
    } else{
    changeState(SplashErrorState());
    }
  }
}