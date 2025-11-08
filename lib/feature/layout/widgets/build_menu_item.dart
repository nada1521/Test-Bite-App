import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';

import '../../../core/helper/navigation/push_to.dart';
import '../../../core/router/app_router_path.dart';
import '../../../core/widgets/custom_list_title_widget.dart';

Widget buildMenuItems(BuildContext context) {
  return Column(
    children: [
      CustomListTitleWidget(
        icon: Icons.favorite_border_outlined,
        title: LocaleKeys.favorite_screen_favorite_dishes.tr(),
        onTap: () => pushNamed(context, AppRoutes.favScreen),
      ),
      CustomListTitleWidget(
        icon: Icons.settings,
        title: LocaleKeys.setting_settings.tr(),
        onTap: () => pushNamed(context, AppRoutes.settingScreen),
      ),
    ],
  );
}
