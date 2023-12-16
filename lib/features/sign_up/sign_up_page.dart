import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/utils/uppercase_text_formatter.dart';
import 'package:finance_app/common/widgets/custom_list_links.dart';
import 'package:finance_app/common/widgets/custom_password_form_field.dart';
import 'package:finance_app/common/widgets/custom_text_form_field.dart';
import 'package:finance_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();

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
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'Your name',
                  hintText: 'John Doe',
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  inputFormatter: [
                    UpperCaseTextFormatter(),
                  ],
                  validator: (value){                    
                    if(value != null && value.isEmpty){
                      return 'The names field is required';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  labelText: 'Your email',
                  hintText: 'johndoe@gmail.com',
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value){                    
                    if(value != null && value.isEmpty){
                      return 'The email field is required';
                    }
                    return null;
                  },
                ),
                CustomPasswordFormField(
                  hintText: '**********',
                  labelText: 'Choose your password',
                  validator: (value){                    
                    if(value != null && value.isEmpty){
                      return 'The password field is required';
                    }
                    return null;
                  },
                ),
                CustomPasswordFormField(
                  hintText: '**********',
                  labelText: 'Confirm your password',
                  validator: (value){                    
                    if(value != null && value.isEmpty){
                      return 'The password confirm field is required';
                    }
                    return null;
                  },
                ),
              ],
            )
          ),
      
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0
            ),
            child: PrimaryButton(
              text: 'Sign Up',
              onPressed: (){
                final valid = _formKey.currentState != null && _formKey.currentState!.validate();
              },
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

