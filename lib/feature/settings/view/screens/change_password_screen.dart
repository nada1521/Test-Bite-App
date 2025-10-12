import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/form_change_password.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Change Password"),
      body: SingleChildScrollView(child: FormChangePasswordWidget()),
    );
  }
}
