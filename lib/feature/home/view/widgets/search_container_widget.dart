import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/router/app_router_path.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_text_style.dart';

class SearchContainerWidget extends StatelessWidget {
  const SearchContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNamed(context, AppRoutes.searchScreen);
      },
      child: Container(
        width: double.infinity,
        height: 50.h,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(8),

        decoration: BoxDecoration(
          border: Border.all(color: NewAppColors.disabled),
          color: NewAppColors.white,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.search, color: NewAppColors.disabled),
            horizontalSpace(4),
            Text(
              LocaleKeys.home_screen_discover_global_flavors.tr(),
              style: AppTextStyle.fontWeightW400Size16HintTextColor,
            ),
            Spacer(flex: 1),
            Icon(Icons.filter_alt, color: NewAppColors.disabled),
          ],
        ),
      ),
    );
  }
}
