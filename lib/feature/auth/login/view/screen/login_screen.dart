import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../widgets/do_not_have_an_account.dart';
import '../widgets/logo_image.dart';
import '../widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LogoImage(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Login", style: AppTextStyle.fontSize32Bold),
            ),
            LoginFormWidget(),
            DoNotHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
