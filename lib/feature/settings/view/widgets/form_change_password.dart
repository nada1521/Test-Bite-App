import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/core/utils/app_text_style.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import 'package:tasty_bite/core/widgets/custom_progress_indecator.dart';
import '../../../../core/helper/function/failure_snakbar.dart';
import '../../../../core/helper/function/success_scaffold.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/new_app_colors.dart';
import '../../../../core/utils/validation/app_validation.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/text_form_field_widget.dart';
import '../logic/change_password_cubit.dart';

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
              prefixIcon: Icons.lock,
              controller: cubit.currentController,
              hintText: LocaleKeys.change_password_screen_current_password.tr(),
              validator: (password) =>
                  AppValidation.passwordValidation(password),
              isObscureText: true,
            ),
            verticalSpace(10),
            AppTextFormField(
              prefixIcon: Icons.lock,
              controller: cubit.newController,
              isObscureText: true,
              hintText:LocaleKeys.change_password_screen_new_password.tr(),
              validator: (password) =>
                  AppValidation.passwordValidation(password),
            ),
            verticalSpace(10),
            AppTextFormField(
              prefixIcon: Icons.lock,
              controller: cubit.confirmController,
              isObscureText: true,
              hintText:LocaleKeys.change_password_screen_confirm_new_password.tr(),
              validator: (confirmPassword) =>
                  AppValidation.confirmPasswordValidation(
                    cubit.newController.text,
                    confirmPassword,
                  ),
            ),
            BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) {
                if (state is SuccessChangePassword) {
                  successShowSnackBar(
                    context: context,
                    title: LocaleKeys.change_password_screen_password_changed_successfully.tr(),
                  );
                }
                if (state is FailureChangePassword) {
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
                  widget: state is LoadingChangePassword
                      ? CustomProgressIndecator()
                      : Text(
                         LocaleKeys.change_password_screen_change.tr(),
                          style: AppTextStyle.appbarSize22WhiteColor.copyWith(
                            color: NewAppColors.white,
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
