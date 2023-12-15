import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;
  final String? hintText;
  final String? labelText;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.padding,
    this.textInputAction,
    this.textCapitalization,
    this.textInputType,
    this.inputFormatter,
    this.maxLength,
    this.hintText,
    this.labelText,
  }): super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField>{
  final defaultBorder = const OutlineInputBorder();

  @override
  Widget build(BuildContext context) {
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
        inputFormatters: widget.inputFormatter,
        style: const TextStyle(
          height: 1.0
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyles.inputLabelText.apply(
            color: AppColors.dark200
          ),
          hintText: widget.hintText,
          hintStyle: AppTextStyles.inputHintText.apply(
            color: AppColors.dark100
          ),
          focusedBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.primaryColor200,
              width: 2.0
            )
          ),
          enabledBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(
              color: AppColors.primaryColor100
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