import 'package:flutter/material.dart';

import '../../feature/auth/signup/data/models/text_field_model.dart';
import '../../feature/auth/signup/logic/sign_up_cubit.dart';
import '../utils/validation/app_validation.dart';
import '../utils/validation/validators/phone_validator.dart';

List<TextFieldModel> signupFormList(SignupCubit cubit) {
  return [
    TextFieldModel(
      controller: cubit.firstNameController,
      hintText: "First name",
      validator: (value) => AppValidation.nameValidation(value),
      prefixIcon: Icons.person,
    ),
    TextFieldModel(
      controller: cubit.lastNameController,
      hintText: "Last name",
      validator: (value) => AppValidation.fullNameValidation(value),
      prefixIcon: Icons.person,
    ),
    TextFieldModel(
      prefixIcon: Icons.phone_android,
      controller: cubit.phoneController,
      hintText: "Phone number",
      validator: (phoneNumber) =>
          PhoneValidator.isPhoneNumberValid(phoneNumber ?? ""),
    ),
    TextFieldModel(
      controller: cubit.emailController,
      prefixIcon: Icons.email,
      hintText: "Email",
      validator: (value) => AppValidation.emailValidation(value),
    ),

    TextFieldModel(
      controller: cubit.passwordController,
      hintText: "Password",
      isPassword: true,
      prefixIcon: Icons.lock,
      validator: (password) => AppValidation.passwordValidation(password),
    ),
    TextFieldModel(
      controller: cubit.confirmPasswordController,
      prefixIcon: Icons.lock,
      hintText: "Confirm password",
      isPassword: true,
      validator: (confirmPassword) => AppValidation.confirmPasswordValidation(
        cubit.passwordController.text,
        confirmPassword,
      ),
    ),
  ];
}
