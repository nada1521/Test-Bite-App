class SignupRequestModel {
  final String phoneNumber;
  final String firstName;
  final String email;
  final String password;
  final String lastName;
  final String confirmPassword;
  final String country;
  final String? tokn;

  SignupRequestModel({
    required this.phoneNumber,
    required this.firstName,
    required this.email,
    required this.password,
    required this.lastName,
    required this.confirmPassword,
    required this.country,
    this.tokn,
  });
  Map<String, dynamic> toJson() {
    return {
      "phone_number": phoneNumber,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
      "country": country,
      "tokn": tokn,
    };
  }
   factory SignupRequestModel.fromJson(Map<String, dynamic> json) {
    return SignupRequestModel(
      phoneNumber: json["phone_number"] ?? "",
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      confirmPassword: json["confirm_password"] ?? "",
      country: json["country"] ?? "",
      tokn: json["tokn"],
    );
  }
}
