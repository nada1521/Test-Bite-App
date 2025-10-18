import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/feature/auth/signup/view/widgets/row_name_widget.dart';
import '../../../../../core/constants/signup_form_list.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/utils/app_text_style.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(5),
            Text(
              "Create Account",
              style: AppTextStyle.fontSize32BoldTextPrimaryColor.copyWith(
                fontSize: 30.sp,
              ),
            ),
            Text(
              "Create your account and explore recipes from around the world ",
              style: AppTextStyle.fontWeightW400Size18TextDark,
            ),
            verticalSpace(10),
            RowNameWidget(cubit: cubit),
            ListViewFormWidget(textFieldModels: signupFormList(cubit)),
            verticalSpace(10),
            DropdownSelscteWidget(cubit: cubit),
            verticalSpace(20),
            BlocConsumerActionButton(),
            verticalSpace(15),
            HaveAccountWidget(),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}
