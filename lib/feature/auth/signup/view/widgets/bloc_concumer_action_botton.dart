import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/core/widgets/custom_progress_indecator.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/base/pop_up_dialog.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../logic/sign_up_cubit.dart';
import '../../logic/sign_up_state.dart';
import 'otp_registered_successfully_widget.dart';

class BlocConsumerActionButton extends StatelessWidget {
  const BlocConsumerActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is Success) {
          showPopup(context, OtpRegisteredSuccessfullyWidget());
        } else if (state is Error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
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
                  "Creat an account",
                  style: AppTextStyle.fontSize14Bold.copyWith(fontSize: 18),
                ),
        );
      },
    );
  }
}
