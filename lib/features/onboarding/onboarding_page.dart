import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/widgets/custom_list_links.dart';
import 'package:finance_app/common/widgets/primary_button.dart';
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
            flex: 2,
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
                    horizontal: 42.0, 
                    vertical: 16.0
                  ),
                  child: PrimaryButton(
                    text: 'Get Started',
                    onPressed: (){},
                  ),
                ),
                CustomListLinks(
                  onPressed: (){},
                  children: [
                    const Text(
                      'Already have account? ',
                      style: AppTextStyles.smallText,
                    ),
                    Text(
                      'Already have account? ',
                      style: AppTextStyles.smallText.copyWith(
                        color: AppColors.primaryColor100
                      ),
                    )
                  ],
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