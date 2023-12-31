import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/features/home/home_page_view.dart';
import 'package:finance_app/features/onboarding/onboarding_page.dart';
import 'package:finance_app/features/profile/profile_page.dart';
import 'package:finance_app/features/sign_in/sign_in_page.dart';
import 'package:finance_app/features/sign_up/sign_up_page.dart';
import 'package:finance_app/features/splash/splash_page.dart';
import 'package:finance_app/features/stats/stats_page.dart';
import 'package:finance_app/features/wallet/wallet_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget  {
  const App({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: "/",
      routes: {
        AppRoutes.initial: (context) => const SplashPage(),
        AppRoutes.onboarding: (context) => const OnboardingPage(),
        AppRoutes.signUp: (context) => const SignUpPage(),
        AppRoutes.signIn: (context) => const SignInPage(),
        AppRoutes.home: (context) => const HomePageView(),
        AppRoutes.stats: (context) => const StatsPage(),
        AppRoutes.wallet: (context) => const WalletPage(),
        AppRoutes.profile: (context) => const ProfilePage(),
      }
    );
  }
}