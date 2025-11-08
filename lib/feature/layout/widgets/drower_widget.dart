import 'package:flutter/material.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import '../../../core/helper/spacing.dart';
import 'build_menu_item.dart';
import 'build_user_section.dart';

class DrowerWidget extends StatelessWidget {
  const DrowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NewAppColors.white,
      padding: const EdgeInsetsDirectional.only(top: 80, start: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildUserSection(context),
          verticalSpace(20),
          buildMenuItems(context),
        ],
      ),
    );
  }
}
