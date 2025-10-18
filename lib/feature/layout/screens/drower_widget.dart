import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/core/utils/app_text_style.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import 'package:tasty_bite/feature/auth/signup/logic/user_data_state.dart';
import '../../../core/helper/navigation/push_to.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/router/app_router_path.dart';
import '../../../core/widgets/custom_progress_indecator.dart';
import '../../auth/signup/logic/user_data_cubit.dart';
import '../widgets/custom_list_title_widget.dart';
import '../widgets/uploadied_image_widget.dart';

class DrowerWidget extends StatelessWidget {
  const DrowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NewAppColors.white,
      padding: const EdgeInsets.only(top: 50, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<UserDataCubit, UserDataState>(
            builder: (context, state) {
              if (state is UserDataInitial) {
                return const Text("No data");
              } else if (state is UserDataLoading) {
                return const CustomProgressIndecator(
                  color: NewAppColors.primary,
                );
              } else if (state is UserDataError) {
                return Text("Error: ${state.message}");
              } else if (state is UserDataSuccess) {
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
          ),
          SizedBox(height: 20),
          CustomListTitleWidget(
            icon: Icons.favorite_border_outlined ,
            title: "Favorite Item",
            onTap: () {
              pushNamed(context, AppRoutes.favScreen);
            },
          ),
          CustomListTitleWidget(
            icon: Icons.settings,
            title: "settings",
            onTap: () {
              pushNamed(context, AppRoutes.settingScreen);
            },
          ),
        ],
      ),
    );
  }
}
