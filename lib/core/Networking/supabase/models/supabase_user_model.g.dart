// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupabaseUserResponse _$SupabaseUserResponseFromJson(
        Map<String, dynamic> json) =>
    SupabaseUserResponse(
      userName: json['user_name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      address: json['address'] as String,
      fcmToken: json['fcm_token'] as String,
    );

Map<String, dynamic> _$SupabaseUserResponseToJson(
        SupabaseUserResponse instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'fcm_token': instance.fcmToken,
    };
