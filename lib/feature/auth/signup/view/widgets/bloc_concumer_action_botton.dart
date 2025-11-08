import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/core/helper/function/failure_snakbar.dart';
import 'package:tasty_bite/core/helper/function/success_scaffold.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import 'package:tasty_bite/core/widgets/custom_progress_indecator.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/helper/navigation/push_to.dart';
import '../../../../../core/router/app_router_path.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../logic/sign_up_cubit.dart';
import '../logic/sign_up_state.dart';

class BlocConsumerActionButton extends StatelessWidget {
  const BlocConsumerActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is Success) {
          successShowSnackBar(
            title: "${LocaleKeys.otp_congratulations.tr()}${LocaleKeys.otp_account_created_successfully.tr()}",
            context: context,
          );
          pushNamedAndRemoveUntil(
            context,
            AppRoutes.homeAndDrowerScreen,
            arguments: getIt<SignupCubit>().countryController.text,
          );
        } else if (state is Error) {
          failureSnakBar(title: state.error, context: context);
          log(state.error);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () async {
            cubit.emitSignupStates();
          },
          widget: state is Loading
              ? CustomProgressIndecator()
              : Text(
                 LocaleKeys.auth_label_create_an_account.tr(),
                  style: AppTextStyle.fontWeightBoldSize17ButtomColorWhite,
                ),
        );
      },
    );
  }
}
