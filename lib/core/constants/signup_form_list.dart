
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
    ),
    TextFieldModel(
      controller: cubit.lastNameController,
      hintText: "Last name",
      validator: (value) => AppValidation.fullNameValidation(value),
    ),
    TextFieldModel(
      isPhoneNumber: true,
      countryCodePicker: (country) {
        if (country != null) {
          cubit.countryCode = country.dialCode;
        }
      },
      controller: cubit.phoneController,
      hintText: "Phone number",
      validator: (phoneNumber) =>
          PhoneValidator.isPhoneNumberValid(phoneNumber ?? ""),
    ),
    TextFieldModel(
      controller: cubit.emailController,
      hintText: "Email",
      validator: (value) => AppValidation.emailValidation(value),
    ),
    TextFieldModel(
      controller: cubit.passwordController,
      hintText: "Password",
      isPassword: true,
      validator: (password) => AppValidation.passwordValidation(password),
    ),
    TextFieldModel(
      controller: cubit.confirmPasswordController,
      hintText: "Confirm password",
      isPassword: true,
      validator: (confirmPassword) => AppValidation.confirmPasswordValidation(
        cubit.passwordController.text,
        confirmPassword,
      ),
    ),
  ];
}
