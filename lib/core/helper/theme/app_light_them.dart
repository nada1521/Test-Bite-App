import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/app_text_style.dart';
import '../../utils/new_app_colors.dart';

class AppLightTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: AppConstants.fontNameEnglish,
      fontFamilyFallback: [AppConstants.fontNameArabic],
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        titleTextStyle: AppTextStyle.appbarSize22WhiteColor,
        backgroundColor: NewAppColors.primary,
        iconTheme: IconThemeData(color: NewAppColors.white),
      ),
      brightness: Brightness.light,

      primaryColor: NewAppColors.primary,
      colorScheme: const ColorScheme.light(
        primary: NewAppColors.primary,
        secondary: NewAppColors.secondary,
      ),

      // textTheme: const TextTheme(
      //   bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      //   bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
      //   titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      // ),
     
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF1976D2)),
        ),
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
