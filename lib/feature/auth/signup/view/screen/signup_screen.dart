import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/generated/tr_locale_keys.g.dart';
import '../../../login/view/widgets/logo_image.dart';
import '../widgets/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                LocaleKeys.signup_screen_creat_an_accunt.tr(),
                style: AppTextStyle.fontWeightW600Size20ColorTextMain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Create your account and explore recipes from around the world 🍲",
                style: AppTextStyle.fontWeightRegularSize16TextSecondColor2
                    .copyWith(color: AppColors.textSecondColor),
              ),
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SignupFormWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
