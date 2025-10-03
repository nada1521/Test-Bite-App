import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        hintText: hintText,
        hintStyle: AppTextStyle.fontWeightW500Size18TextSecondColor,
        suffixIcon: Icon(suffixIcon),
        fillColor: AppColors.white,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
