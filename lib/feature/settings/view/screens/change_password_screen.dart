import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/helper/spacing.dart';
import 'package:tasty_bite/core/utils/app_colors.dart';
import 'package:tasty_bite/core/utils/app_text_style.dart';
import 'package:tasty_bite/core/widgets/custom_appbar.dart';
import 'package:tasty_bite/core/widgets/custom_button.dart';
import 'package:tasty_bite/core/widgets/text_form_field_widget.dart';

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

class FormChangePasswordWidget extends StatefulWidget {
  const FormChangePasswordWidget({super.key});

  @override
  State<FormChangePasswordWidget> createState() =>
      _FormChangePasswordWidgetState();
}

class _FormChangePasswordWidgetState extends State<FormChangePasswordWidget> {
  final _formKey = GlobalKey<FormState>();
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _loading = false;
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _changePassword() async {
    if (!_formKey.currentState!.validate()) return;
    final user = _auth.currentUser;
    if (user == null || user.email == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No authenticated user.')));
      return;
    }

    setState(() => _loading = true);
    final currentPass = _currentController.text.trim();
    final newPass = _newController.text.trim();

    try {
      // 1) Reauthenticate
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPass,
      );

      await user.reauthenticateWithCredential(credential);

      // 2) Update password in Firebase Auth
      await user.updatePassword(newPass);

      // 3) (اختياري) — لو عندك حقل في Firestore تريد تحديثه (مثال فقط)
      // *** تحذير: لا تخزن الباسورد كنص عادي! هذا مثال توضيحي فقط. ***
      // إذا كنت تخزن هاش أو علم (flag) فقط حدّث الحقل الملائم.
      // final usersRef = _firestore
      //     .collection(FirebaseStrings.users)
      //     .doc(user.uid);

      // // مثال: نضع حقل lastPasswordChangeAt لمتابعة آخر تغيير
      // await usersRef.update({
      //   FirebaseStrings.confirmPassword: FieldValue.serverTimestamp(),
      //   // 'passwordHash': '...' // لو عندك هاش فعلي حدّثه هنا (لا تخزن plain text)
      // });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password changed successfully.')),
      );
      _currentController.clear();
      _newController.clear();
      _confirmController.clear();
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Unexpected error: $e')));
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  String? _validatePassword(String? v) {
    if (v == null || v.isEmpty) return 'Please enter password';
    if (v.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            AppTextFormField(
              controller: _currentController,
              hintText: "Current password",
              validator: _validatePassword,
              isObscureText: true,
            ),
            verticalSpace(10),
            AppTextFormField(
              controller: _newController,
              isObscureText: true,
              hintText: "new password",
              validator: _validatePassword,
            ),
            verticalSpace(10),
            AppTextFormField(
              controller: _confirmController,
              isObscureText: true,
              hintText: "confirm new password",
              validator: (v) {
                final base = _validatePassword(v);
                if (base != null) return base;
                if (v != _newController.text) return 'Passwords do not match';
                return null;
              },
            ),
            CustomButton(
              onTap: () async {
                if (!_loading) {
                  await _changePassword();
                }
              },

              widget: _loading
                  ? CircularProgressIndicator()
                  : Text(
                      "Change",
                      style: AppTextStyle.appbarSize22MainColor.copyWith(
                        color: AppColors.white,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
