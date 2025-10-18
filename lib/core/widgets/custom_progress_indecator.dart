import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';

class CustomProgressIndecator extends StatelessWidget {
  const CustomProgressIndecator({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(
        color: color ?? NewAppColors.white,
        
        size: 30.h,
      ),
    );
  }
}
