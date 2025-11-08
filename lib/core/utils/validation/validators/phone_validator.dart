import 'package:flutter/services.dart';

abstract class PhoneValidator {
  static const int validDigitsAfter966 = 10; 
  static isPhoneNumberValid(String phone) {
    if (phone.isEmpty) {
      return "Phone number is required";
    }
    if (phone.length < 10) {
      return "Phone number is short";
    }
     else if (phone.length > 11) {
        return "Phone number is not valid";
      }
    return null;
  }

  static bool isWhatsAppValid(String phone) => isPhoneNumberValid(phone);

  /// English digits only input (Saudi numbers)
  static RegExp phoneInputRegExp = RegExp(
    r'^(?:\+9665\d{0,8}|05\d{0,8}|009665\d{0,8}|9665\d{0,8})$',
  );

  /// English + Arabic digits input (Saudi numbers)
  static RegExp phoneInputBothNumbersRegExp = RegExp(
    r'^(?:\+9665[0-9٠-٩]{0,8}|05[0-9٠-٩]{0,8}|009665[0-9٠-٩]{0,8}|9665[0-9٠-٩]{0,8})$',
  );

  static List<TextInputFormatter> phoneInputFormatters = [
    FilteringTextInputFormatter.allow(phoneInputRegExp),
  ];

  static List<TextInputFormatter> phoneInputFormattersBothNumbers = [
    FilteringTextInputFormatter.allow(phoneInputBothNumbersRegExp),
  ];
}
