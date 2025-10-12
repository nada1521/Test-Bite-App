import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/Networking/api_result.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/helper/cache_helper.dart';
import '../data/models/user_login_request_body.dart';
import '../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());

    final fcmToken = await FirebaseMessaging.instance.getToken();
   

    log(fcmToken!);
    final result = await _loginRepo.firebaseLogin(
      UserLoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
        fcmToken: fcmToken,
      ),
    );
    result.when(
      success: (success) async {
        await CacheHelper.getSecuredString(AppConstants.userFcmToken);
        emit(const LoginState.success());
      },
      failure: (failure) {
        emit(LoginState.error(error: failure.toString()));
      },
    );
    // await _loginRepo
    //     .login(
    //       UserLoginRequestBody(
    //         email: emailController.text,
    //         password: encryptedPassword,
    //         fcmToken: fcmToken,
    //       ),
    //     )
    //     .then((res) async {
    //       await CacheHelper.setSecuredString(
    //         AppConstants.userFcmToken,
    //         fcmToken,
    //       );

    //       if (res == 'success') {
    //         emit(const LoginState.success());
    //       } else {
    //         emit(LoginState.error(error: res));
    //       }
    //     });
  }

  Future<void> saveToken(String token) async {
    await CacheHelper.setSecuredString(AppConstants.userToken, token);
  }
}
