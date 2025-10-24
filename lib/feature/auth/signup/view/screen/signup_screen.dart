import 'package:flutter/material.dart';
import '../../../login/view/widgets/logo_image.dart';
import '../widgets/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [LogoImage(), SignupFormWidget()],
          ),
        ),
      ),
    );
  }
}
