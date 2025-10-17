// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/helper/spacing.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_text_style.dart';
// import '../../data/models/image_and_title_model.dart';

// class CategoryItem extends StatelessWidget {
//   const CategoryItem({super.key, required this.imageAndTitleModel});
//   final ImageAndTitleModel imageAndTitleModel;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
//           height: 150.h,
//           width: 220.w,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(imageAndTitleModel.image),
//               fit: BoxFit.cover,
//             ),
//             borderRadius: BorderRadius.circular(16.r),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
//           height: 150.h,
//           width: 220.w,
//           decoration: BoxDecoration(
//             color: AppColors.black12,
//             borderRadius: BorderRadius.circular(16.r),
//           ),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             verticalSpace(80),
//             Text(
//               imageAndTitleModel.title,
//               textAlign: TextAlign.center,
//               style: AppTextStyle.fontWeightW600Size20ColorTextMain.copyWith(
//                 color: AppColors.white,
//               ),
//             ),
//             verticalSpace(22),
//           ],
//         ),
//       ],
//     );
//   }
// }
