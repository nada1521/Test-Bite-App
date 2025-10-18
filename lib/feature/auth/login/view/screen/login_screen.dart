import 'package:flutter/material.dart';
import '../widgets/do_not_have_an_account.dart';
import '../widgets/logo_image.dart';
import '../widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [LogoImage(), LoginFormWidget(), DoNotHaveAnAccount()],
          ),
        ),
      ),
    );
  }
}
