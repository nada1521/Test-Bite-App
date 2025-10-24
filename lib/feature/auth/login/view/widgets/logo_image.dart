import 'package:flutter/material.dart';
import '../../../../../core/utils/app_assets.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.logo, width: double.infinity);
  }
}
