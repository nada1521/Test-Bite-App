import 'package:flutter/material.dart';

import '../../../core/helper/navigation/push_to.dart';
import '../../../core/router/app_router_path.dart';
import '../../../core/widgets/custom_list_title_widget.dart';

Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        CustomListTitleWidget(
          icon: Icons.favorite_border_outlined,
          title: "Favorite Item",
          onTap: () => pushNamed(context, AppRoutes.favScreen),
        ),
        CustomListTitleWidget(
          icon: Icons.settings,
          title: "Settings",
          onTap: () => pushNamed(context, AppRoutes.settingScreen),
        ),
      ],
    );
  }
