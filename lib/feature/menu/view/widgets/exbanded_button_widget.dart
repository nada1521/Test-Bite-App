import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';

import '../../../../core/utils/app_text_style.dart';

class ExpandedButtonWidget extends StatelessWidget {
  const ExpandedButtonWidget({
    super.key,
    required this.title,
    required this.isDescriptionSelected,
    this.borderRadius,
    required this.onPressed,
  });
  final String title;
  final bool isDescriptionSelected;
  final BorderRadius? borderRadius;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: isDescriptionSelected
              ? NewAppColors.primaryLight
              : NewAppColors.disabled,
          borderRadius:
              borderRadius ??
              const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: isDescriptionSelected
                ? AppTextStyle.fontSize14Bold
                : AppTextStyle.fontSize14Bold.copyWith(
                    color: NewAppColors.primaryLight,
                  ),
          ),
        ),
      ),
    );
  }
}
