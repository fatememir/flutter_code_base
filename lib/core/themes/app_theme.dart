import 'package:flutter/material.dart';

import 'my_colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.blue,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Mouldy',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 28,
          color: AppColors.blackPearl,
        ),
        displayMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: AppColors.blackPearl,
        ),
        displaySmall: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.blackPearl,
          fontSize: 16,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.ebonyClay,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Mouldy",
          fontWeight: FontWeight.w400,
          color: AppColors.regentGray,
          fontSize: 15,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.blackPearl),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        buttonColor: AppColors.blue,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: AppColors.blue,
      scaffoldBackgroundColor: AppColors.blackPearl,
      fontFamily: 'Mouldy',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 28,
          color: AppColors.white,
        ),
        displayMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: AppColors.white,
        ),
        displaySmall: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.white,
          fontSize: 16,
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w400,
          color: AppColors.white_60,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Mouldy",
          fontWeight: FontWeight.w400,
          color: AppColors.regentGray,
          fontSize: 15,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        buttonColor: AppColors.blue,
      ),
    );
  }
}
