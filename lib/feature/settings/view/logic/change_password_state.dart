part of 'change_password_cubit.dart';

abstract class ChangePasswordState {}

class Initial extends ChangePasswordState {}

class LoadingChangePassword extends ChangePasswordState {}

class SuccessChangePassword extends ChangePasswordState {}

class FailureChangePassword extends ChangePasswordState {
  final FailureServer errorMessage;

  FailureChangePassword({required this.errorMessage});
}
