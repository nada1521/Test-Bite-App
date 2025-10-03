import 'package:easy_localization/easy_localization.dart';
import 'package:tasty_bite/feature/auth/login/logic/login_cubit.dart';
import '../../feature/auth/signup/data/models/text_field_model.dart';
import '../utils/generated/tr_locale_keys.g.dart';
import '../utils/validation/app_validation.dart';

List<TextFieldModel> loginFormList(LoginCubit cubit) {
  return [
    TextFieldModel(
      controller: cubit.emailController,
      hintText: "Email",
      validator: (email) => AppValidation.emailValidation(email),
    ),
    TextFieldModel(
      isPassword: true,
      controller: cubit.passwordController,
      hintText: LocaleKeys.auth_label_password.tr(),
      validator: AppValidation.passwordValidation,
    ),
  ];
}
