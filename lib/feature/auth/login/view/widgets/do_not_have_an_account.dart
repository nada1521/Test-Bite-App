import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../../core/router/app_router_path.dart';
import '../../../../../core/utils/app_text_style.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: "Don't have an account? ",
              style: AppTextStyle.fontWeightnormalSize16ColorTextDark,
            ),
            TextSpan(
              text: "Sign Up",
              style: AppTextStyle.fontSize16BoldTextPrimaryColor,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.signUpScreen,
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}
