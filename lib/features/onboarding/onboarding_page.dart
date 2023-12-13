import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Container(height: 50, color: AppColors.offWhite,),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.offWhite,
              child: Image.asset('assets/images/man.png', fit: BoxFit.contain),
            ),
          ),
          Text(
            'Spend Smarter', 
            style: AppTextStyles.mediumText.apply(color: AppColors.primaryColor200)
          ),
          Text(
            'Save  More',
            style: AppTextStyles.mediumText.apply(color: AppColors.primaryColor200)
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){}, 
            child: const Text('Get Started')
          ),
          const SizedBox(height: 20),
          Text(
            'Already have account? Sign in',
            style: AppTextStyles.smallText.apply(color: AppColors.dark100)
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}