import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
              text: "Do you have an account? ",
              style: AppTextStyle.size16ColorTextMedium,
            ),
            TextSpan(
              text: "Login",
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
