import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helper/navigation/push_to.dart';
import '../../../../../core/router/app_router_path.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/generated/tr_locale_keys.g.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: "${LocaleKeys.signup_screen_do_you_have_account.tr()} ",
              style: AppTextStyle.fontWeightRegularSize16TextSecondColor2
                  .copyWith(fontSize: 14),
            ),
            TextSpan(
              text: LocaleKeys.core_sign_in.tr(),
              style: AppTextStyle.fontWeightRegularSize16TextSecondColor2
                  .copyWith(color: AppColors.clickableColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  pushNamed(context, AppRoutes.loginScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}
