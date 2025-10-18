import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/app_assets.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class WelcomText extends StatelessWidget {
  const WelcomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: NewAppColors.bagelight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: NewAppColors.textMedium),
      ),

      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 190.w,
            child: Text(
              "Cook, learn, and taste the world - one delicious recipe at a time 🍲🌎",
              style: AppTextStyle.fontWeightW600Size17ColorTextPrimaryColor
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          ),
          Image.asset(AppAssets.sticar, width: 120.w, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
