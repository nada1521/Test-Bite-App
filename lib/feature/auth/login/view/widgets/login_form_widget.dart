import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/core/constants/login_form_list.dart';
import 'package:tasty_bite/core/utils/app_text_style.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../signup/view/widgets/signup_form_field.dart';
import '../logic/login_cubit.dart';
import 'login_action_button.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();
    return Form(
      key: loginCubit.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(5),
            Text(LocaleKeys.auth_label_login.tr(), style: AppTextStyle.fontSize32BoldTextPrimaryColor),
            verticalSpace(6),
            Text(
              LocaleKeys.auth_label_welcome_back.tr(),
              style: AppTextStyle.fontWeightW500Size18TextSecondColor,
            ),
            ListViewFormWidget(textFieldModels: loginFormList(loginCubit)),
            verticalSpace(20),
            LoginActionButton(),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
