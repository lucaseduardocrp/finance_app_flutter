import 'package:flutter/material.dart';
import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  final BorderRadius _borderRadius = const BorderRadius.all(Radius.circular(38.0));

  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        height: 54.0,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: onPressed != null ? AppColors.primaryGradient : AppColors.secondGradient
          ),
        ),
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: onPressed,
          child: Align(
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