import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/Networking/api_result.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/helper/cache_helper.dart';
import '../../../../core/utils/helper/encryption_helper.dart';
import '../data/models/signup_request.dart';
import '../data/repos/signup_repos.dart';
import 'sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepos signupRepo;

  SignupCubit(this.signupRepo) : super(const SignupState.initial());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  String countryCode = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    if (formKey.currentState!.validate()) {
      emit(const SignupState.loading());

      final fcmToken = await FirebaseMessaging.instance.getToken();
      final encryptedPassword = EncryptionHelper().encryptText(
        passwordController.text,
      );

      final result = await signupRepo.signUp(
        SignupRequestModel(
          phoneNumber: '$countryCode${phoneController.text}',
          firstName: firstNameController.text,
          email: emailController.text,
          password: encryptedPassword,
          lastName: lastNameController.text,
          confirmPassword: confirmPasswordController.text,
          country: countryController.text,
          tokn: fcmToken,
        ),
      );
      result.when(
        failure: (error) => emit(SignupState.error(error: error.toString())),
        success: (data) async {
          await CacheHelper.setSecuredString(
            AppConstants.userFcmToken,
            fcmToken ?? "",
          );
          log(">>> country before API: ${countryController.text}"); // ✨

          emit(SignupState.success());
        },
      );
      // .then((res) async {
      //   if (res == 'success') {
      //     await CacheHelper.setSecuredString(
      //       AppConstants.userFcmToken,
      //       fcmToken,
      //     );
      //     emit(const SignupState.success());
      //   } else {
      //     emit(SignupState.error(error: res));
      //   }
      // });
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    return super.close();
  }
}
