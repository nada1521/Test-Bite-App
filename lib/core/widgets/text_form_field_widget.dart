import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';
import 'country_code_picker.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final bool? isPhoneNumber;
  final Function(CountryCode?)? onChangedCountryCode;
  final Widget? prefixIcon;
  final int? maxLines;

  final TextInputType? keyboardType;
  final Function(String)? onChang;
  final CountryCode? countryCodes;

  final InputBorder? border;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.isPhoneNumber,
    this.onChangedCountryCode,
    this.prefixIcon,
    this.maxLines,

    this.keyboardType,
    this.onChang,
    this.countryCodes,

    this.border,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.onChang,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              widget.contentPadding ??
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          hintStyle:
              widget.hintStyle ??
              AppTextStyle.fontWeightRegularSize16TextSecondColor2.copyWith(
                color: AppColors.textSecondColor,
              ),
          hintText: widget.hintText,
          suffixIcon: widget.isObscureText == true
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                )
              : widget.suffixIcon,

          prefixIcon: widget.isPhoneNumber == true
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SizedBox(
                    width: 85.h,
                    child: Row(
                      children: [
                        CountryCodePicker(
                          onChanged: widget.onChangedCountryCode,
                          initialSelection: widget.countryCodes,
                        ),

                        Container(
                          height: 15.h,
                          width: 1.w,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                )
              : widget.prefixIcon,
        ),

        textAlign: widget.isPhoneNumber == true
            ? TextAlign.start
            : TextAlign.start,

        obscureText: _obscureText,
        validator: (value) {
          return widget.validator(value);
        },
        maxLines: widget.maxLines ?? 1,
      ),
    );
  }
}
