import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading;
  const factory SignupState.success() = Success;
  const factory SignupState.error({required String error}) = Error;
}
