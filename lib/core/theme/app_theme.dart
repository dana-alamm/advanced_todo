import 'package:flutter/material.dart';

class AppColors {

  static const Color greyColor=Color(0xffADAEBC);
  static const Color blueColor=Color(0xff3B82F6);
  static const Color grey2Color=Color(0xffE5E7EB);
  static const Color darkMode=Color(0xff161622);
  static const Color bigDarkBox=Color(0xff25273D);
  static const Color grey3Color=Color(0xff90A1B9);
  static const Color purple=Color(0xff7008E7);
  static const Color borderPurple=Color(0xFFE2D9F3);
  static const Color textGrey=Color(0xff62748E);
  static const Color borderGrey=Color(0xFFE2E8F0);
  static const Color lightBackGround = Color(0xFFF8FAFC);

  static const Color highPriority = Color(0xFFFF3B30);  
  static const Color mediumPriority = Color(0xFFFF9500); 
  static const Color lowPriority = Color(0xFF34C759);   

  static Color getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return highPriority;
      case 'medium':
        return mediumPriority;
      case 'low':
        return lowPriority;
      default:
        return grey3Color;
    }
  }

  
  static Color getPriorityBgColor(String priority) {
    return getPriorityColor(priority).withOpacity(0.15);
  }
}

class AppTheme{

  static ThemeData get lightTheme{
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackGround,
      colorScheme: const ColorScheme.light(
        surface: Colors.white,
        primary: AppColors.purple,
        secondary: AppColors.blueColor,
        onSurface: Colors.black,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color:Colors.black87,
        ),
      ),
    );
  }
  static ThemeData get darkTheme{
   return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkMode,
    dividerColor: Colors.white10,
    colorScheme: const ColorScheme.dark(
      surface: AppColors.bigDarkBox,
      primary: AppColors.purple,
      secondary: AppColors.blueColor,
      onSurface: Colors.white
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontFamily: 'Inter',
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
    ),
    bodyMedium: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: Colors.white,
        ),
   )
   );
  }
}