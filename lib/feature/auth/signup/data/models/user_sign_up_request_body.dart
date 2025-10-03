
import 'package:json_annotation/json_annotation.dart';

part 'user_sign_up_request_body.g.dart';

@JsonSerializable()
class UserSignUpRequestBody {
  @JsonKey(name: 'user_name')
  final String userName;
  final String email;
  final String password;
  final String address;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
    @JsonKey(name: 'fcm_token')

  final String fcmToken;
  // final String userId;

  UserSignUpRequestBody({
    required this.userName,
    required this.email,
    required this.password,
    required this.address,
    required this.phoneNumber,
    required this.fcmToken,
    // required this.userId,
  });

  Map<String, dynamic> toJson() => _$UserSignUpRequestBodyToJson(this);
}
