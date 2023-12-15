import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/widgets/custom_list_links.dart';
import 'package:finance_app/common/widgets/custom_text_form_field.dart';
import 'package:finance_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24.0),      
        children: [
          Text(
            'Spend Smarter', 
            style: AppTextStyles.mediumText.apply(
              color: AppColors.primaryColor100
            )
          ),
          Text(
            'Save More', 
            style: AppTextStyles.mediumText.apply(
              color: AppColors.primaryColor100
            )
          ),
          Image.asset('assets/images/signup.png'),
          const CustomTextFormField(
            labelText: 'Your name',
            hintText: 'John Doe',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22.0,
              vertical: 10.0
            ),
            child: PrimaryButton(
              text: 'Sign Up',
              onPressed: (){},
            ),
          ),
          CustomListLinks(
            onPressed: (){},
            children: [
              const Text(
                'Already Have Account? ', 
                style: AppTextStyles.smallText
              ),
              Text(
                'Sign in', 
                style: AppTextStyles.smallText.apply(
                  color: AppColors.primaryColor100
                )
              ),
            ]
          )
        ]
      )
    );
  }
}

