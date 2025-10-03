import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class ClipRRectImageWidget extends StatelessWidget {
  const ClipRRectImageWidget({super.key, this.imageNet, this.imageAss});
  final String? imageNet;
  final String? imageAss;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: imageNet != null
          ? Image.network(
              imageNet!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            )
          : Image.asset(
              imageAss!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
    );
  }
}

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.positionendIndex,
    required this.dotsCount,
  });
  final double positionendIndex;
  final int dotsCount;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: positionendIndex,
      decorator: DotsDecorator(activeColor: AppColors.mainColor),
    );
  }
}
