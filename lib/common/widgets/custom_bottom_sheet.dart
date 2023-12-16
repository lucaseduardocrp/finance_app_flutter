import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

Future<bool?> customModalBottomSheet({
  required BuildContext context,
  required String content,
  String? buttonText,
  VoidCallback? onPressed,
  List<Widget>? actions,
}) {

  return showModalBottomSheet(
    context: context, 
    builder: (BuildContext context) => Container(
      height: 200,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            content, 
            style: AppTextStyles.mediumText18
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 16.0
            ),
            child: PrimaryButton(
              text: buttonText!,
              onPressed: onPressed ?? () => Navigator.pop(context),
            ),
          )          
        ],
      )
    )
  );
}