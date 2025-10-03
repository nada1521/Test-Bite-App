import 'package:flutter/material.dart';
import '../../../../../core/widgets/text_form_field_widget.dart';
import '../../data/models/text_field_model.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({super.key, required this.textFieldModel});
  final TextFieldModel textFieldModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          onChangedCountryCode: textFieldModel.countryCodePicker,
          suffixIcon: textFieldModel.suffixIcon,
          prefixIcon: textFieldModel.prefixIcon,
          hintText: textFieldModel.hintText,
          validator: textFieldModel.validator ?? (value) => null,
          controller: textFieldModel.controller,
          isObscureText: textFieldModel.isPassword,
          isPhoneNumber: textFieldModel.isPhoneNumber,
          maxLines: textFieldModel.maxLines,
        ),
      ],
    );
  }
}
