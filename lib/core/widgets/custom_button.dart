import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final double? width, height;
  final VoidCallback? onTap;
  final Color? startColor;
  final Color? endColor;
  final Widget? widget;

  const CustomButton({
    super.key,
    required this.onTap,
    this.title,
    this.width,
    this.height,
    this.startColor,
    this.endColor,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: width ?? double.infinity,
        height: height ?? 49.h,
        decoration: BoxDecoration(
          color: NewAppColors.primary,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Center(
          child:
              widget ??
              Text(
                title ?? "",
                style: AppTextStyle.fontSize14Bold.copyWith(fontSize: 18),
              ),
        ),
      ),
    );
  }
}
