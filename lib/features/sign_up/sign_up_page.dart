import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/utils/uppercase_text_formatter.dart';
import 'package:finance_app/common/widgets/custom_list_links.dart';
import 'package:finance_app/common/widgets/custom_password_form_field.dart';
import 'package:finance_app/common/widgets/custom_text_form_field.dart';
import 'package:finance_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(
          left: 24.0,
          right: 24.0,
          bottom: 24.0,
          top: 46.0,
        ),
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  'Start Saving', 
                  style: AppTextStyles.mediumText.apply(
                    color: AppColors.primaryColor100
                  )
                ),
                Text(
                  'Your Money!', 
                  style: AppTextStyles.mediumText.apply(
                    color: AppColors.primaryColor100
                  )
                ),
                const SizedBox(height: 22.0),
                Image.asset('assets/images/signup.png'),
              ]
            ),
          ),
          const SizedBox(height: 42.0),
          CustomTextFormField(
            labelText: 'Your name',
            hintText: 'John Doe',
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            inputFormatter: [
              UpperCaseTextFormatter(),
            ],
          ),
          const CustomTextFormField(
            labelText: 'Your email',
            hintText: 'johndoe@gmail.com',
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const CustomPasswordFormField(
            hintText: '**********',
            labelText: 'Choose your password',
          ),
          const CustomPasswordFormField(
            hintText: '**********',
            labelText: 'Confirm your password',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
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

