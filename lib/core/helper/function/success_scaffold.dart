import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

void successShowSnackBar({required String title,context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: AppTextStyle.fontWeightW500Size18TextSecondColor.copyWith(
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.green,
      duration: Duration(seconds: 2),
    ),
  );
}
