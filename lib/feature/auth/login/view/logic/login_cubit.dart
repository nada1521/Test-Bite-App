import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/Networking/api_result.dart';
import '../../../../../core/helper/check_states_user.dart';
import '../../data/models/user_login_request_body.dart';
import '../../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  CheckStatesUser checkStatesUser = CheckStatesUser();
  void emitLoginStates() async {
    emit(const LoginState.loading());

    final result = await _loginRepo.firebaseLogin(
      UserLoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.when(
      success: (success) async {
        await checkStatesUser.login();
        emit(const LoginState.success());
      },
      failure: (failure) {
        emit(LoginState.error(error: failure.toString()));
      },
    );
  }

  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();
    await super.close();
  }
}
