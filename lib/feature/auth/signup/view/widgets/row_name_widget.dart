import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';

import '../../../../../core/utils/validation/app_validation.dart';
import '../../../../../core/widgets/text_form_field_widget.dart';
import '../../logic/sign_up_cubit.dart';

class RowNameWidget extends StatelessWidget {
  const RowNameWidget({super.key, required this.cubit});
  final SignupCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextFormField(
            controller: cubit.firstNameController,
            hintText: "First name",
            validator: (value) => AppValidation.nameValidation(value),
            prefixIcon: Icons.person,
            keyboardType: TextInputType.name,
          ),
        ),
        Container(
          width: 1.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: NewAppColors.textLight.withAlpha(100),
            borderRadius: BorderRadius.circular(20.r),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5),
        ),
        Expanded(
          child: AppTextFormField(
            controller: cubit.lastNameController,
            hintText: "Last name",
            validator: (value) => AppValidation.fullNameValidation(value),
            prefixIcon: Icons.person,
            keyboardType: TextInputType.name,
          ),
        ),
      ],
    );
  }
}
