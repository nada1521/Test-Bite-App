import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/utils/new_app_colors.dart';
import '../../../core/widgets/custom_progress_indecator.dart';
import '../../../core/widgets/uploadied_image_widget.dart';
import '../../auth/signup/view/logic/user_data_cubit.dart';
import '../../auth/signup/view/logic/user_data_state.dart';

Widget buildUserSection(BuildContext context) {
  return BlocBuilder<UserDataCubit, UserDataState>(
    builder: (context, state) {
      if (state is UserDataLoading) {
        return const CustomProgressIndecator(color: NewAppColors.primary);
      }

      if (state is UserDataError) {
        return Text(
          "Error: ${state.message}",
          style: AppTextStyle.fontWeightNourmalSize14RedColor,
        );
      }

      if (state is UserDataSuccess) {
        final user = state.user;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UploadedImage(userEmail: user.email),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "${user.firstName} ${user.lastName}",
                style: AppTextStyle.fontWeightW700Size18ColorPrimary,
              ),
            ),
          ],
        );
      }

      return const SizedBox.shrink();
    },
  );
}
