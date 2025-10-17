import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/app_colors.dart';

import 'new_app_colors.dart';

abstract class AppTextStyle {
  // primary color text styles
  static final fontSize32BoldTextPrimaryColor = TextStyle(
    color: NewAppColors.primary,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );
  static final fontWeightW600Size17ColorTextPrimaryColor = TextStyle(
    color: NewAppColors.primary,
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
  );
  static final fontSize16BoldTextPrimaryColor = TextStyle(
    color: NewAppColors.primary,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
  );

  // secandary color text styles
  static final fontWeightW400Size18TextSecondColor = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: NewAppColors.textMedium,
  );
  static final fontWeightW500Size18TextSecondColor = TextStyle(
    fontSize: 18.sp,
    color: NewAppColors.textDark,
    fontWeight: FontWeight.w500,
  );
  static final fontWeightnormalSize16ColorTextSecond = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16.sp,
    color: NewAppColors.textMedium,
  );
  static final fontWeightBoldSize20 = TextStyle(
    color: NewAppColors.primary,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static final fontWeightBoldSize20ButtomColorWhite = TextStyle(
    color: AppColors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static final fontWeightW400Size16HintTextColor = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: NewAppColors.textLight,
  );

  static final fontSize14Bold = TextStyle(
    color: AppColors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static final fontWeightNourmalSize14RedColor = TextStyle(
    color: NewAppColors.error,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );
  static final fontWeightW700Size18ColorMain = TextStyle(
    color: AppColors.mainColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );
  static final appbarSize22MainColor = TextStyle(
    color: AppColors.white,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );

  static final fontWeightBoldSize16ColorHintIcon = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
    color: AppColors.hintTextColor,
  );

  static final fontWeightW700Size22ColorGreen = TextStyle(
    color: AppColors.green,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );
  static final fontWeightNormalSize17TextClickable = TextStyle(
    color: NewAppColors.textDark,
    fontSize: 17.sp,
    fontWeight: FontWeight.normal,
  );
  static final fontWeightW600Size17ColorsGreen = TextStyle(
    color: AppColors.green,
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
  );
}
