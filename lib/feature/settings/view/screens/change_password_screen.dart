import 'package:flutter/material.dart';
import '../widgets/form_change_password.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title:Text("Change Password") ),
      body: SingleChildScrollView(child: FormChangePasswordWidget()),
    );
  }
}
