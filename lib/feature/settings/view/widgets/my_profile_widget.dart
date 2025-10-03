import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helper/spacing.dart';
import 'package:tasty_bite/feature/auth/signup/logic/user_data_cubit.dart';
import 'package:tasty_bite/feature/auth/signup/logic/user_data_state.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class MyProfileWidget extends StatelessWidget {
  const MyProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataSuccess) {
          final user = state.user;
          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  child: SvgPicture.asset(AppSvgs.userProfil),
                ),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(10),
                      Text(
                        "${user.firstName} ${user.lastName}",
                        style: AppTextStyle.fontWeightW600Size20ColorTextMain,
                      ),
                      Text(
                        user.phoneNumber,
                        style: AppTextStyle.fontWeightW500Size18TextSecondColor,
                      ),
                      Text(
                        user.email,
                        style: AppTextStyle.fontWeightW500Size18TextSecondColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
