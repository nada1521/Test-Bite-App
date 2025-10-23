import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/Networking/api_result.dart';
import '../../../../core/helper/check_states_user.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
 CheckStatesUser checkStatesUser = CheckStatesUser();
  void emitSignupStates() async {
    if (formKey.currentState!.validate()) {
      emit(const SignupState.loading());
      final fcmToken = await FirebaseMessaging.instance.getToken();
      final result = await signupRepo.signUp(
        SignupRequestModel(
          phoneNumber: phoneController.text,
          firstName: firstNameController.text.toUpperCase(),
          email: emailController.text,
          password: passwordController.text,
          lastName: lastNameController.text.toUpperCase(),
          confirmPassword: confirmPasswordController.text,
          country: countryController.text,
          tokn: fcmToken,
        ),
      );
      result.when(
        failure: (error) {
          emit(SignupState.error(error: error.toString()));
        },
        success: (data) async {
          await checkStatesUser.login();
           emit(SignupState.success());
           },
      );
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    emailController.dispose();
    return super.close();
  }
}
