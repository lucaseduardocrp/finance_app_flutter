import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/common/utils/uppercase_text_formatter.dart';
import 'package:finance_app/common/utils/validator.dart';
import 'package:finance_app/common/widgets/custom_bottom_sheet.dart';
import 'package:finance_app/common/widgets/custom_circular_progress.dart';
import 'package:finance_app/common/widgets/custom_list_links.dart';
import 'package:finance_app/common/widgets/custom_password_form_field.dart';
import 'package:finance_app/common/widgets/custom_text_form_field.dart';
import 'package:finance_app/common/widgets/primary_button.dart';
import 'package:finance_app/features/sign_up/sign_up_controller.dart';
import 'package:finance_app/features/sign_up/sign_up_state.dart';
import 'package:finance_app/locator.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(); 
  final _emailController = TextEditingController(); 
  final _passwordController = TextEditingController(); 
  final _signUpController = locator.get<SignUpController>(); 

  @override
  void dispose(){
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _signUpController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    _signUpController.addListener(() {
      if(_signUpController.state is SignUpLoadingState){
        showDialog(
          context: context, 
          builder: (context) => const CustomCircularProgress()
        );
      }
      
      if(_signUpController.state is SignUpSuccessState){
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }

      if(_signUpController.state is SignUpErrorState){
        final error = _signUpController.state as SignUpErrorState;

        Navigator.pop(context);
        customModalBottomSheet(
          context: context,
          content: error.message,
          buttonText: 'Tentar Novamente'
        );
      }
    });
  }

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
                  controller: _nameController,
                  labelText: 'Your name',
                  hintText: 'John Doe',
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  inputFormatter: [
                    UpperCaseTextFormatter(),
                  ],
                  validator: Validator.validatedName,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Your email',
                  hintText: 'johndoe@gmail.com',
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: Validator.validatedEmail,
                ),
                CustomPasswordFormField(
                  controller: _passwordController,
                  hintText: '**********',
                  labelText: 'Choose your password',
                  helperText: 'Must have at least 8 characters, 1 capital letter and 1 number.',
                  validator: Validator.validatedPassword,
                ),
                CustomPasswordFormField(
                  hintText: '**********',
                  labelText: 'Confirm your password',
                  validator: (password) {
                    return Validator.validatedConfirmPassword(password, _passwordController.text);
                  } 
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

                if(valid){
                  _signUpController.signUp(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                }
              },
            ),
          ),
          CustomListLinks(
            onPressed: (){
              Navigator.pushNamed(context, AppRoutes.signIn);
            },
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