part of 'change_password_cubit.dart';

abstract class ChangePasswordState {}

class Initial extends ChangePasswordState {}

class Loading extends ChangePasswordState {}

class Success extends ChangePasswordState {}

class Failure extends ChangePasswordState {
  final FailureServer errorMessage;

  Failure({required this.errorMessage});
}
