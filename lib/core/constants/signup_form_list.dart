import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasty_bite/core/widgets/text_form_field_widget.dart';

import '../../feature/auth/signup/logic/sign_up_cubit.dart';
import '../utils/validation/app_validation.dart';
import '../utils/validation/validators/phone_validator.dart';

List<AppTextFormField> signupFormList(SignupCubit cubit) {
  return [
    
    AppTextFormField(
      prefixIcon: Icons.phone_android,
      controller: cubit.phoneController,
      hintText: "Phone number",
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.phone,
      validator: (phoneNumber) =>
          PhoneValidator.isPhoneNumberValid(phoneNumber ?? ""),
    ),
   

  
    AppTextFormField(
      controller: cubit.emailController,
      prefixIcon: Icons.email,
      hintText: "Email",
      validator: (value) => AppValidation.emailValidation(value),
      keyboardType: TextInputType.emailAddress,
    ),

    AppTextFormField(
      controller: cubit.passwordController,
      hintText: "Password",
      isObscureText: true,
      prefixIcon: Icons.lock,
      validator: (password) => AppValidation.passwordValidation(password),
      keyboardType: TextInputType.visiblePassword,
    ),
    AppTextFormField(
      controller: cubit.confirmPasswordController,
      prefixIcon: Icons.lock,
      hintText: "Confirm password",
      isObscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (confirmPassword) => AppValidation.confirmPasswordValidation(
        cubit.passwordController.text,
        confirmPassword,
      ),
    ),
  ];
}
