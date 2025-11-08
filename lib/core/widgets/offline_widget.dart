
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
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
            LocaleKeys.common_errors_no_internet_connection.tr(),
            style: AppTextStyle.fontWeightNourmalSize14RedColor,
          ),
        ],
      ),
    );
  }
}
