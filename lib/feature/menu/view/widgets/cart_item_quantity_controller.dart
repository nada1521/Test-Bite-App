// import 'package:asmaq_thraa/core/helper/spacing.dart';
// import 'package:asmaq_thraa/core/utils/app_text_style.dart';
// import 'package:asmaq_thraa/features/cart/view/cubit/cart_cubit.dart';
// import 'package:asmaq_thraa/features/menu/data/models/menu_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/utils/app_colors.dart';

// class AddToCartController extends StatelessWidget {
//   final ValueChanged<int>? onQuantityChanged;
//   final ItemDetails itemDetails;

//   const AddToCartController({
//     super.key,
//     this.onQuantityChanged,
//     required this.itemDetails,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartCubit, CartState>(
//       builder: (context, state) {
//         CartCubit cubit = context.read<CartCubit>();
//         return SizedBox(
//           height: 28.h,
//           child: Row(
//             children: [
//               IncrementAndDecrementContainar(
//                 title: '+',
//                 onTap: () {
//                   cubit.increment(itemDetails);
//                 },
//               ),
//               Container(
//                 width: 30.w,
//                 decoration: BoxDecoration(
//                   border: const Border.symmetric(
//                     horizontal: BorderSide(
//                       color: AppColors.mainColor,
//                       width: 1.5,
//                     ),
//                   ),
//                 ),
//                 child: Center(
//                   child: Text(
//                     itemDetails.quantity.toString(),
//                     style: AppTextStyle.fontSize14Bold.copyWith(
//                       color: AppColors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               itemDetails.quantity > 1
//                   ? IncrementAndDecrementContainar(
//                       title: '-',
//                       onTap: () {
//                         cubit.decrement(itemDetails);
//                       },
//                     )
//                   : IncrementAndDecrementContainar(
//                       onTap: () {
//                         cubit.delete(itemDetails);
//                       },
//                       deletIcon: Icon(
//                         Icons.delete,
//                         color: Colors.white,
//                         size: 20.sp,
//                       ),
//                     ),
//               horizontalSpace(3),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class IncrementAndDecrementContainar extends StatelessWidget {
//   const IncrementAndDecrementContainar({
//     super.key,
//     this.title,
//     this.onTap,
//     this.deletIcon,
//   });
//   final String? title;
//   final VoidCallback? onTap;
//   final Widget? deletIcon;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         width: 30.w,
//         decoration: const BoxDecoration(color: AppColors.mainColor),
//         child: Center(
//           child:
//               deletIcon ??
//               Text(
//                 title ?? '',
//                 style: AppTextStyle.fontSize14Bold.copyWith(fontSize: 16.sp),
//               ),
//         ),
//       ),
//     );
//   }
// }
