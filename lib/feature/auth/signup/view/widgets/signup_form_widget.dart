import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/signup_form_list.dart';
import '../../../../../core/helper/spacing.dart';
import '../../logic/sign_up_cubit.dart';
import 'bloc_concumer_action_botton.dart';
import 'dropdown_selscte_widget.dart';
import 'have_account.dart';
import 'signup_form_field.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            ListViewFormWidget(textFieldModels: signupFormList(cubit)),
            verticalSpace(10),
            DropdownSelscteWidget(cubit: cubit),
            verticalSpace(20),
            BlocConsumerActionButton(),
            verticalSpace(15),
            HaveAccount(),
            verticalSpace(25),
          ],
        ),
      ),
    );
  }
}
