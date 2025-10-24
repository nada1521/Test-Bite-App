
import 'package:flutter/material.dart';
import '../utils/app_text_style.dart';
import '../utils/new_app_colors.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.wifi_off, size: 64, color: NewAppColors.primary),
          Text(
            "No internet connection",
            style: AppTextStyle.fontWeightNourmalSize14RedColor,
          ),
        ],
      ),
    );
  }
}
