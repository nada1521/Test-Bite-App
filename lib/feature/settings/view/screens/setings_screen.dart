import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/utils/app_colors.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import '../../../../core/helper/spacing.dart';
import '../widgets/my_profile_widget.dart';
import '../widgets/settings_option_widget.dart';

class SetingsScreen extends StatelessWidget {
  const SetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: AppBar(title: Text(LocaleKeys.setting_settings.tr())),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyProfileWidget(),
            SettingsOptionsWidget(),
            verticalSpace(80),
          ],
        ),
      ),
    );
  }
}
