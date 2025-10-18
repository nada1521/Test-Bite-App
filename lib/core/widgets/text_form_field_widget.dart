import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';

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
  final IconData? prefixIcon;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
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

    this.border, this.inputFormatters,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscureText ?? false;
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextFormField(
        //next  عشان يعمل
        textInputAction: TextInputAction.next,
        inputFormatters: widget.inputFormatters,
        focusNode: _focusNode,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.onChang,
        keyboardType: widget.keyboardType,
        controller: widget.controller,

        style: AppTextStyle.fontWeightNormalSize17TextClickable,
        decoration: InputDecoration(
          fillColor: AppColors.white,
          filled: true,
          border: InputBorder.none,
          isDense: true,
          errorStyle: AppTextStyle.fontWeightNourmalSize14RedColor,
          contentPadding:
              widget.contentPadding ??
              EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          hintStyle: _isFocused
              ? AppTextStyle.fontWeightW400Size16HintTextColor
              : AppTextStyle.fontWeightW400Size16HintTextColor.copyWith(
                  color: NewAppColors.disabled,
                ),
          hintText: widget.hintText,
          suffixIcon: widget.isObscureText == true
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: _obscureText
                      ? Icon(
                          Icons.visibility_off_outlined,
                          size: 20,
                          color: LightThemeColors.iconInactive,
                        )
                      : Icon(
                          Icons.visibility_outlined,
                          size: 20,
                          color: LightThemeColors.iconActive,
                        ),
                )
              : widget.suffixIcon,

          prefixIcon: Icon(
            widget.prefixIcon,
            size: 20,
            color: _isFocused
                ? LightThemeColors.iconActive
                : LightThemeColors.iconInactive,
          ),
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
