import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomProgressIndecator extends StatelessWidget {
  const CustomProgressIndecator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.white,
    );
  }
}