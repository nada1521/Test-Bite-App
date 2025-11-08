import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import '../../../../../core/helper/navigation/push_to.dart';
import '../../../../../core/router/app_router_path.dart';
import '../../../../../core/utils/app_text_style.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: LocaleKeys.signup_screen_do_you_have_account.tr(),
              style: AppTextStyle.size16ColorTextMedium,
            ),
            TextSpan(
              text:LocaleKeys.auth_label_login.tr(),
              style: AppTextStyle.fontSize16BoldTextPrimaryColor,
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
