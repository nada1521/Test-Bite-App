import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_text_style.dart';

class RowChildrenTowText extends StatelessWidget {
  const RowChildrenTowText({
    super.key,
    required this.titleOne,
    required this.titleTow, this.textStyle1, this.textStyle2,
  });
  final String titleOne;
  final String titleTow;
  final TextStyle? textStyle1;
  final TextStyle? textStyle2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleOne, style:textStyle1?? AppTextStyle.fontWeightBoldSize16ColorHintIcon),
          Text(titleTow, style:textStyle2?? AppTextStyle.fontWeightBoldSize16ColorHintIcon),
        ],
      ),
    );
  }
}
