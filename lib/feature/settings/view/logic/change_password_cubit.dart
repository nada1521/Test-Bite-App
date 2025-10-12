import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/helper/error/failure.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(Initial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController currentController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool loading = false;
  final auth = FirebaseAuth.instance;

  Future<void> changePassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(Loading());
        final user = auth.currentUser!;
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentController.text.trim(),
        );
        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newController.text.trim());
        currentController.clear();
        newController.clear();
        confirmController.clear();
        emit(Success());
      } on FirebaseAuthException catch (e) {
         log("Firebase error ❌: ${e.code}");
        final failure = FailureServer.fromFirebaseAuthException(e);
        emit(Failure(errorMessage: failure));
      }
    }
  }
}
