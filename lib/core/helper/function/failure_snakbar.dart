import 'package:flutter/material.dart';
import 'package:tasty_bite/core/utils/app_text_style.dart';

import '../../utils/app_colors.dart';

void failureSnakBar({required String title,context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: AppTextStyle.fontWeightW500Size18TextSecondColor.copyWith(
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.red,
      duration: Duration(seconds: 2),
    ),
  );
}