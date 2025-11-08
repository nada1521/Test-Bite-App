import '../../data/models/signup_request.dart';

abstract class UserDataState {}

class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataSuccess extends UserDataState {
  final SignupRequestModel user;
  UserDataSuccess(this.user);
}

class UserDataError extends UserDataState {
  final String message;
  UserDataError(this.message);
}
