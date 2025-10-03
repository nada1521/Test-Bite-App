import 'package:flutter/services.dart';

abstract class PhoneValidator {
  static const int validDigitsAfter966 = 10; // 0 + 9 digits

  /// ✅ Normalize رقم الهاتف السعودي لأي صيغة إلى صيغة واحدة (96605XXXXXXXX)
  static String normalizeSaudiPhoneNumber(String phone) {
    phone = phone.replaceAll(' ', '').replaceFirst('+', '');

    // استبدال 00966 بـ 966
    if (phone.startsWith('00966')) {
      phone = phone.replaceFirst('00966', '966');
    }

    // لو الرقم بادئ بـ 05 → نشيل الـ 0 ونضيف 966
    if (phone.startsWith('05')) {
      phone = '966${phone.substring(1)}';
    }

    // لو الرقم بادئ بـ 966 وبعدين 5 → نضيف صفر بعد 966
    if (phone.startsWith('966') && phone.length >= 12) {
      final digitsAfter966 = phone.substring(3);
      if (!digitsAfter966.startsWith('0')) {
        phone = '9660$digitsAfter966';
      }
    }

    return phone;
  }

  /// ✅ فحص صلاحية الرقم السعودي بعد التنظيف
  static isPhoneNumberValid(String phone) {
    if (phone.isEmpty) {
      return "Phone number is required";
    }
    if (phone.length < 10) {
      return "Phone number is short";
    }
    //  else if (phone.length < 11) {
    //     return "Phone number is tall";
    //   }
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
