// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'user_login_request_body.g.dart';

@JsonSerializable()
class UserLoginRequestBody {
  final String email;
  final String password;

  UserLoginRequestBody({
    required this.email,
    required this.password,

  });

  Map<String, dynamic> toJson() =>
      _$UserLoginRequestBodyToJson(this);
}
