import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/core/constants/login_form_list.dart';
import 'package:tasty_bite/core/utils/app_text_style.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../signup/view/widgets/signup_form_field.dart';
import '../../logic/login_cubit.dart';
import 'bloc_consumer_action_button.dart';

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
            Text(
              "Welcom Back ",
              style: AppTextStyle.fontWeightRegularSize16TextSecondColor2
                  .copyWith(color: AppColors.textSecondColor),
            ),
            ListViewFormWidget(textFieldModels: loginFormList(loginCubit)),
            verticalSpace(20),
            SigninActionButton(),
            verticalSpace(15),
          ],
        ),
      ),
    );
  }
}
