import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_assets.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.logo, height: 237.h, width: double.infinity);
  }
}
