// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/helper/spacing.dart';
// import '../../data/models/menu_model.dart';
// import 'image_slider_widget.dart';

// class ItemImagesSlider extends StatefulWidget {
//   const ItemImagesSlider({super.key, required this.itemDetails});

//   final ItemDetails itemDetails;

//   @override
//   State<ItemImagesSlider> createState() => _ItemImagesSliderState();
// }

// class _ItemImagesSliderState extends State<ItemImagesSlider> {
//   late PageController pageController;
//   @override
//   void initState() {
//     pageController = PageController(initialPage: 0)
//       ..addListener(() {
//         setState(() {});
//       });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         verticalSpace(30),
//         SizedBox(
//           height: 270.h,
//           child: PageView.builder(
//             controller: pageController,
//             itemCount: widget.itemDetails.images.length,
//             itemBuilder: (context, index) {
//               return Image.asset(
//                 widget.itemDetails.images[index],
//                 height: 280.h,
//               );
//             },
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: CustomDotsIndicator(
//             dotsCount: widget.itemDetails.images.length,
//             positionendIndex: pageController.hasClients
//                 ? (pageController.page ?? 0)
//                 : 0,
//           ),
//         ),
//       ],
//     );
//   }
// }
