// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'user_login_request_body.g.dart';

@JsonSerializable()
class UserLoginRequestBody {
  final String email;
  final String password;
  @JsonKey(name: 'fcm_token')
  final String fcmToken;
  UserLoginRequestBody({
    required this.email,
    required this.password,
    required this.fcmToken,
  });

  Map<String, dynamic> toJson() =>
      _$UserLoginRequestBodyToJson(this);
}
