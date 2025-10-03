import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/app_colors.dart';

abstract class AppTextStyle {
  static final fontWeightBoldSize20 = TextStyle(
    color: AppColors.mainColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );
  static final fontSize32Bold = TextStyle(
    color: AppColors.textMainColor,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );
  static final fontWeightRegularSize16TextSecondColor2 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondColor2,
  );
  static final fontWeightW500Size18TextSecondColor = TextStyle(
    fontSize: 18.sp,
    color: AppColors.textSecondColor,
    fontWeight: FontWeight.w500,
  );
  static final fontSize14Bold = TextStyle(
    color: AppColors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
  static final fontWeightW700Size18ColorMain = TextStyle(
    color: AppColors.mainColor,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );
  static final appbarSize22MainColor = TextStyle(
    color: AppColors.mainColor,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );
  static final fontWeightW600Size20ColorTextMain = TextStyle(
    color: AppColors.textMainColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static final fontWeightW600Size17ColorTextMain = TextStyle(
    color: AppColors.textMainColor,
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
  );
  static final fontWeightnormalSize16ColorTextSecond = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16.sp,
    color: AppColors.textSecondColor,
  );
  static final fontWeightBoldSize16ColorHintIcon = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
    color: AppColors.hintIconColor,
  );

  static final fontWeightW700Size22ColorGreen = TextStyle(
    color: AppColors.green,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );
  static final fontWeightW600Size15 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
  );
  static final fontWeightW600Size17ColorsGreen = TextStyle(
    color: AppColors.green,
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
  );
}
