import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/common/extensions/sizes.dart';
import 'package:finance_app/common/widgets/custom_circular_progress.dart';
import 'package:finance_app/features/splash/splash_controller.dart';
import 'package:finance_app/features/splash/splash_state.dart';
import 'package:finance_app/locator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  final _splashController = locator.get<SplashController>();

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => Sizes.init(context));

    _splashController.isUserLogged();
    _splashController.addListener(() {
      if(_splashController.state is SplashSuccessState){
        Navigator.pushNamed(context, AppRoutes.home);
      } else{
        Navigator.pushNamed(context, AppRoutes.onboarding);
      }
    });   
  }

  @override
  void dispose(){
    _splashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.primaryGradient
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'FinanceApp', 
              style: AppTextStyles.largeText.apply(
                color: AppColors.white
              )
            ),
            const CustomCircularProgress(),
          ],
        ),
      ),
    );
  }
}