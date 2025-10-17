import 'package:flutter/material.dart';
import 'package:tasty_bite/core/utils/app_colors.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/my_profile_widget.dart';
import '../widgets/settings_option_widget.dart';

class SetingsScreen extends StatelessWidget {
  const SetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppbar(title: 'Settings', centerTitle: false),
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
