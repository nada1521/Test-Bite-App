// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpRequestBody _$UserSignUpRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UserSignUpRequestBody(
      userName: json['user_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      address: json['address'] as String,
      phoneNumber: json['phone_number'] as String,
      fcmToken: json['fcm_token'] as String,
    );

Map<String, dynamic> _$UserSignUpRequestBodyToJson(
        UserSignUpRequestBody instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'fcm_token': instance.fcmToken,
    };
