import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/core/utils/app_text_style.dart';
import 'package:tasty_bite/feature/auth/login/view/logic/login_state.dart';

import '../../../../core/helper/function/failure_snakbar.dart';
import '../../../../core/helper/function/success_scaffold.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/validation/app_validation.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/text_form_field_widget.dart';
import '../logic/change_password_cubit.dart' hide Success, Loading;

class FormChangePasswordWidget extends StatelessWidget {
  const FormChangePasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();
    return Form(
      key: cubit.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            AppTextFormField(
              controller: cubit.currentController,
              hintText: "Current password",
              validator: (password) =>
                  AppValidation.passwordValidation(password),
              isObscureText: true,
            ),
            verticalSpace(10),
            AppTextFormField(
              controller: cubit.newController,
              isObscureText: true,
              hintText: "new password",
              validator: (password) =>
                  AppValidation.passwordValidation(password),
            ),
            verticalSpace(10),
            AppTextFormField(
              controller: cubit.confirmController,
              isObscureText: true,
              hintText: "confirm new password",
              validator: (confirmPassword) =>
                  AppValidation.confirmPasswordValidation(
                    cubit.newController.text,
                    confirmPassword,
                  ),
            ),
            BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) {
                if (state is Success) {
                  successShowSnackBar(
                    context: context,
                    title: "Password changed successfully",
                  );
                }
                if (state is Failure) {
                  failureSnakBar(
                    context: context,
                    title: state.errorMessage.toString(),
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  onTap: () {
                    cubit.changePassword(context);
                  },

                  widget: state is Loading
                      ? CircularProgressIndicator()
                      : Text(
                          "Change",
                          style: AppTextStyle.appbarSize22MainColor.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
