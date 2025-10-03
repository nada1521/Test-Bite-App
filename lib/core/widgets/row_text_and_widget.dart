// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../features/menu/data/models/menu_model.dart';
// import '../utils/app_text_style.dart';

// class RowTextAndWidget extends StatelessWidget {
//   const RowTextAndWidget({
//     super.key,
//     required this.itemDetails,
//     required this.title,
//     this.textStyle,
//     this.widget,
//     this.height,
//   });

//   final ItemDetails itemDetails;
//   final String title;
//   final TextStyle? textStyle;
//   final Widget? widget;
//   final double? height;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height ?? 90.h,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: textStyle ?? AppTextStyle.fontWeightW600Size20ColorTextMain,
//           ),
//           widget ?? Image.asset(itemDetails.images[0], height: 90.h),
//         ],
//       ),
//     );
//   }
// }
