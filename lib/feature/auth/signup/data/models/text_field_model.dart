import 'package:flutter/material.dart';
import '../../../../../core/widgets/country_code_picker.dart';

class TextFieldModel {
  final String? title;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  bool? isPassword;
  bool? isPhoneNumber;
  int? maxLines;
  Widget? suffixIcon;
  Widget? prefixIcon;
  final Function(CountryCode?)?  countryCodePicker ;
  TextFieldModel( {
    this.countryCodePicker,
     this.title,
    required this.hintText,
     this.validator,
    required this.controller,
    this.isPassword,
    this.isPhoneNumber,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines
  });
}
