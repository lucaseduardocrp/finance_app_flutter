import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/constants/routes.dart';
import 'package:finance_app/common/utils/validator.dart';
import 'package:finance_app/common/widgets/custom_bottom_sheet.dart';
import 'package:finance_app/common/widgets/custom_circular_progress.dart';
import 'package:finance_app/common/widgets/custom_list_links.dart';
import 'package:finance_app/common/widgets/custom_password_form_field.dart';
import 'package:finance_app/common/widgets/custom_text_form_field.dart';
import 'package:finance_app/common/widgets/primary_button.dart';
import 'package:finance_app/features/sign_in/sign_in_controller.dart';
import 'package:finance_app/features/sign_in/sign_in_state.dart';
import 'package:finance_app/locator.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(); 
  final _passwordController = TextEditingController(); 
  final _signInController = locator.get<SignInController>(); 

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _signInController.dispose();
    super.dispose();
  }

  @override
  void initState(){
    super.initState();
    _signInController.addListener(() {
      if(_signInController.state is SignInLoadingState){
        showDialog(
          context: context, 
          builder: (context) => const CustomCircularProgress()
        );
      }
      
      if(_signInController.state is SignInSuccessState){
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }

      if(_signInController.state is SignInErrorState){
        final error = _signInController.state as SignInErrorState;

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
          top: 136.0,
        ),
        children: [
          Column(
            children: [
              Text(
                'Welcome Back!', 
                style: AppTextStyles.mediumText.apply(
                  color: AppColors.primaryColor100
                )
              ),
              const SizedBox(height: 22.0),
              Image.asset('assets/images/signin.png'),            
              const SizedBox(height: 42.0),
              Form(
                key: _formKey,
                child: Column(
                  children: [
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
                      labelText: 'Your password',
                      validator: Validator.validatedPassword,
                    ),
                  ],
                )
              ),
          
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0
                ),
                child: PrimaryButton(
                  text: 'Sign In',
                  onPressed: (){
                    final valid = _formKey.currentState != null && _formKey.currentState!.validate();

                    if(valid){
                      _signInController.signIn(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    }
                  },
                ),
              ),
              CustomListLinks(
                onPressed: (){
                  Navigator.popAndPushNamed(context, AppRoutes.signUp);
                },
                children: [
                  const Text(
                    "Don't have Account? ", 
                    style: AppTextStyles.smallText
                  ),
                    Text(
                    'Sign up', 
                    style: AppTextStyles.smallText.apply(
                      color: AppColors.primaryColor100
                    )
                  ),
                ]
              )
            ]
          ),
        ]
      )
    );
  }
}