import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/new_app_colors.dart';
import 'custom_progress_indecator.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({super.key, required this.imageUrl, this.hieight});

  final String imageUrl;
  final double? hieight;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 100.w,
      height:hieight??  85.h,
      imageUrl: imageUrl,
      placeholder: (context, url) => Container(
        width: 110.w,
        height: 85.h,
        color: NewAppColors.disabled.withAlpha(30),
        child: CustomProgressIndecator(color: NewAppColors.primary),
      ),
      errorWidget: (context, url, error) => Container(
        width: 100.w,
        height: 85.h,
        color: NewAppColors.error,
        child: const Icon(Icons.error, color: NewAppColors.white),
      ),
      fit: BoxFit.cover,
    );
  }
}
