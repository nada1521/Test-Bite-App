// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpResponseBody _$UserSignUpResponseBodyFromJson(
        Map<String, dynamic> json) =>
    UserSignUpResponseBody(
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      fcmToken: json['fcm_token'] as String,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

