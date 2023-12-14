import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Column(
        children: [
          const SizedBox(height: 48.0),
          Expanded(
            flex: 3,
           child: Image.asset('assets/images/man.png', fit: BoxFit.contain),
          ),
          Container(
            color: AppColors.white,
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Text(
                  'Spend Smarter', 
                  style: AppTextStyles.mediumText.apply(color: AppColors.primaryColor200)
                ),
                Text(
                  'Save  More',
                  style: AppTextStyles.mediumText.apply(color: AppColors.primaryColor200)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, 
                    vertical: 16.0
                  ),
                  child: PrimaryButton(
                    text: 'Get Started',
                    onPressed: (){},
                  ),
                ),
                Text(
                  'Already have account? Sign in',
                  style: AppTextStyles.smallText.apply(color: AppColors.dark100)
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(38.0)),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: onPressed != null ? AppColors.primaryGradient : AppColors.secondGradient
          ),
          borderRadius: const BorderRadius.all(Radius.circular(38.0))
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(38.0)),
          onTap: onPressed,
          child: Container(
            height: 64.0,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(38.0))
            ),
            child: Text(
              text,
              style: AppTextStyles.mediumText18.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}

        