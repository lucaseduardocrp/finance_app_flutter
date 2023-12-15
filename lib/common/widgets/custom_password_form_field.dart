import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomPasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final Widget? sufixIcon;
  final int? maxLength;
  final String? hintText;
  final String? labelText;

  const CustomPasswordFormField({
    Key? key,
    this.controller,
    this.padding,
    this.textInputAction,
    this.textCapitalization,
    this.textInputType,
    this.sufixIcon,
    this.maxLength,
    this.hintText,
    this.labelText,
  }): super(key: key);

  @override
  State<CustomPasswordFormField> createState() => _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField>{
  final defaultBorder = const OutlineInputBorder();

  bool isHiden = true;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(
        vertical: 12.0
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        maxLength: widget.maxLength,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        obscureText: isHiden,
        decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: (){
              setState(() {
                isHiden = !isHiden;
              });
            },
            child: Icon(
              isHiden == true ? Icons.visibility : Icons.visibility_off, 
              color: AppColors.primaryColor100 
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyles.inputLabelText.apply(
            color: AppColors.dark200
          ),
          hintText: widget.hintText,
          hintStyle: AppTextStyles.inputHintText,
          focusedBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.primaryColor200,
              width: 2.0
            )
          ),
          enabledBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.primaryColor200
            )
          ),
          border: defaultBorder,
          errorBorder: defaultBorder,
          focusedErrorBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}