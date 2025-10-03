// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

part 'supabase_user_model.g.dart';

@JsonSerializable()
class SupabaseUserResponse {
  @JsonKey(name: 'user_name')
  final String userName;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String address;
  @JsonKey(name: 'fcm_token')
  final String fcmToken;
  SupabaseUserResponse({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.fcmToken,
  });

  static SupabaseUserResponse fromJson(Map<String, dynamic> json) =>
      _$SupabaseUserResponseFromJson(json);
}
