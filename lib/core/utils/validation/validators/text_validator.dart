import 'package:flutter/services.dart'
    show FilteringTextInputFormatter, TextInputFormatter;

abstract class TextValidator {
  static RegExp notAllowedSpecialCharacters = RegExp(
    r'[!@#$%^&*_+\-,()/|\\;:]',
  );
  static RegExp nameRegExp = RegExp(
    r"^[a-zA-Z\u0621-\u064A]+(([',. -][a-zA-Z\u0621-\u064A ])?[a-zA-Z\u0621-\u064A]*)*$",
  );
  static RegExp fullNameRegExp = RegExp(
    r"^\s*[a-zA-Z\u0621-\u064A]+(?: [a-zA-Z\u0621-\u064A]+)*\s*$",
  );

  /// Deny not allowed special characters
  static List<TextInputFormatter> textFormatters = [
    // Deny not allowed special characters
    FilteringTextInputFormatter.deny(notAllowedSpecialCharacters),
  ];

  /// Accept only name characters
  static List<TextInputFormatter> nameFormatters = [
    // Accept only name characters
    FilteringTextInputFormatter.allow(fullNameRegExp),
  ];

  static bool isNameValid(String? name) {
    if (name == null) return false;
    return nameRegExp.hasMatch(name.trim());
  }

  static bool isFullNameValid(String? name) {
    if (name == null) return false;
    return fullNameRegExp.hasMatch(name.trim());
  }
}
