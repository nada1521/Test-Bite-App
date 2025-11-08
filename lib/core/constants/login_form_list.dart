import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/widgets/text_form_field_widget.dart';
import 'package:tasty_bite/feature/auth/login/view/logic/login_cubit.dart';
import '../utils/generated/tr_locale_keys.g.dart';
import '../utils/validation/app_validation.dart';

List<AppTextFormField> loginFormList(LoginCubit cubit) {
  return [
    AppTextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: cubit.emailController,
      hintText: LocaleKeys.auth_label_email.tr(),
      prefixIcon: Icons.email,
      validator: (email) => AppValidation.emailValidation(email),
    ),
    AppTextFormField(
      keyboardType: TextInputType.visiblePassword,
      isObscureText: true,
      prefixIcon: Icons.lock,
      controller: cubit.passwordController,
      hintText: LocaleKeys.auth_label_password.tr(),
      validator: AppValidation.passwordValidation,
    ),
  ];
}
