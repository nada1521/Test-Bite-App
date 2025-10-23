// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginRequestBody _$UserLoginRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UserLoginRequestBody(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserLoginRequestBodyToJson(
        UserLoginRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
