import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/core/helper/function/failure_snakbar.dart';
import '../../../../../core/router/app_router_path.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_progress_indecator.dart';
import '../logic/login_cubit.dart';
import '../logic/login_state.dart';

class SigninActionButton extends StatelessWidget {
  const SigninActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is Success) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.drowerScreen,
            (route) => false,
          );
        } else if (state is Error) {
          failureSnakBar(title: state.error, context: context);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: state is Loading
              ? null
              : () {
                  cubit.emitLoginStates();
                },
          widget: state is Loading
              ? CustomProgressIndecator()
              : Text(
                  "Login",
                  style: AppTextStyle.fontWeightBoldSize20ButtomColorWhite,
                ),
        );
      },
    );
  }
}
