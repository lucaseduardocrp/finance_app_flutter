import 'package:flutter/painting.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle largeText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 50.0,
  );

  static const TextStyle mediumText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    fontSize: 36.0,
    height: 1.2
  );
 
  static const TextStyle mediumText18 = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
  );
 
  static const TextStyle smallText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
  );

  static const TextStyle inputHintText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );

  static const TextStyle inputLabelText = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
  );
}