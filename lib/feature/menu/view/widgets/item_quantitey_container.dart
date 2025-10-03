import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class ItemQuantiteyContainer extends StatelessWidget {
  const ItemQuantiteyContainer({super.key, required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100.w,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: AppColors.mainColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
