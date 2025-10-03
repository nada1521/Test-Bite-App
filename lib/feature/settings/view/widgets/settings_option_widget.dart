import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/helper/navigation/push_to.dart';
import 'package:tasty_bite/core/router/app_router_path.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/views/widgets/custom_list_title_widget.dart';

class SettingsOptionsWidget extends StatelessWidget {
  const SettingsOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => getSettingsOption(context)[index],
        separatorBuilder: (context, index) => verticalSpace(10),
        itemCount: getSettingsOption(context).length,
      ),
    );
  }
}

List<CustomListTitleWidget> getSettingsOption(BuildContext context) {
  return [
    CustomListTitleWidget(
      icon: Icons.lock_outline,
      title: " Change password",
      onTap: () {
        pushNamed(context, AppRoutes.changePasswordScreen);
      },
    ),
    CustomListTitleWidget(
      icon: Icons.email_outlined,
      title: "Change Email",
      onTap: () {},
    ),
    CustomListTitleWidget(
      icon: Icons.credit_card_outlined,
      title: "My Card",
      onTap: () {},
    ),
    CustomListTitleWidget(
      icon: Icons.description_outlined,
      title: "Terms and conditions",
      onTap: () {},
    ),

    CustomListTitleWidget(
      icon: Icons.privacy_tip_outlined,
      title: "Privacy policy",
      onTap: () {},
    ),
    CustomListTitleWidget(
      icon: Icons.help_outline,
      title: " Help & Support",
      onTap: () {},
    ),
    CustomListTitleWidget(icon: Icons.logout, title: "Log out", onTap: () {}),
  ];
}
