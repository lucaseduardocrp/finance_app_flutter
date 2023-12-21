import 'dart:ui';

class AppColors {
  AppColors._();

  static const Color primaryColor100 =  Color(0xFF63B5AF);
  static const Color primaryColor200 = Color(0xFF438883);

  static const Color dark100 = Color(0x75666666);
  static const Color dark200 = Color(0xFF333333);

  static const Color gray100 = Color(0x75BDBDBD);

  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFEEF8F7);

  static const Color notification = Color(0xFFFFDE84);
  static const Color income = Color(0xFF6FF08B);
  static const Color expense = Color(0xFFFF6868);
  
  static const List<Color> primaryGradient = [
    AppColors.primaryColor100, 
    AppColors.primaryColor200
  ];

  static const List<Color> secondGradient = [
    Color(0xFFB5B5B5), 
    Color(0xFF7F7F7F)
  ];
}