import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/app_colors.dart';
import 'package:tasty_bite/core/utils/app_constants.dart';
import 'new_app_colors.dart';

abstract class AppTextStyle {
  // primary color text styles
  static final fontSize32BoldTextPrimaryColor = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: NewAppColors.primary,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );

  static final fontWeightW600Size17ColorTextPrimaryColor = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: NewAppColors.primary,
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
  );

  static final fontSize16BoldTextPrimaryColor = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: NewAppColors.primary,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static final fontWeightW700Size18ColorPrimary = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: NewAppColors.primary,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );

  // secondary color text styles
  static final fontWeightW400Size18TextDark = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: NewAppColors.textDark,
  );

  static final fontWeightBoldSize18TextMedium = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: NewAppColors.textMedium,
  );

 

  static final fontWeightW500Size18TextSecondColor = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    fontSize: 18.sp,
    color: NewAppColors.textDark,
    fontWeight: FontWeight.w500,
  );

  static final fontWeightnormalSize16ColorTextDark = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    fontWeight: FontWeight.normal,
    fontSize: 18.sp,
    color: NewAppColors.textDark,
  );

  static final fontWeightBoldSize20 = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: NewAppColors.primary,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static final fontWeightBoldSize16ButtomColorWhite = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: AppColors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  static final fontWeightW400Size16HintTextColor = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: NewAppColors.textLight,
  );

  static final fontSize14Bold = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: AppColors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  static final fontWeightNourmalSize14RedColor = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: NewAppColors.error,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );

  static final appbarSize22WhiteColor = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: AppColors.white,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );

  static final fontWeightBoldSize16ColorHintIcon = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
    color: AppColors.hintTextColor,
  );

  static final fontWeightW700Size22ColorGreen = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: AppColors.green,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );

  static final fontWeightNormalSize17TextClickable = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: NewAppColors.textDark,
    fontSize: 17.sp,
    fontWeight: FontWeight.normal,
  );

  static final fontWeightW600Size17ColorsGreen = TextStyle(
    fontFamily: AppConstants.fontNameEnglish,
    fontFamilyFallback: [AppConstants.fontNameArabic],
    color: AppColors.green,
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
  );
}
