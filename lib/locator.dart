import 'package:finance_app/features/home/home_controller.dart';
import 'package:finance_app/features/sign_in/sign_in_controller.dart';
import 'package:finance_app/features/sign_up/sign_up_controller.dart';
import 'package:finance_app/features/splash/splash_controller.dart';
import 'package:finance_app/repositories/transaction_repository.dart';
import 'package:finance_app/services/auth_service.dart';
import 'package:finance_app/services/firebase_auth_service.dart';
import 'package:finance_app/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());

  locator.registerFactory<SplashController>(() => SplashController(const SecureStorage()));
 
  locator.registerFactory<SignInController>(() => SignInController(locator.get<AuthService>()));
  locator.registerFactory<SignUpController>(() => SignUpController(locator.get<AuthService>()));

  locator.registerFactory<TransacationRepository>(() => TransactionRepositoryImpl());
  
  locator.registerLazySingleton<HomeController>(() => HomeController(TransactionRepositoryImpl()));
}