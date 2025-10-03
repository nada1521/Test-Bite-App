import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasty_bite/feature/auth/signup/logic/user_data_state.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/router/app_router_path.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../auth/signup/logic/user_data_cubit.dart';
import '../../../settings/view/screens/setings_screen.dart';
import '../widgets/custom_list_title_widget.dart';

class DrowerWidget extends StatelessWidget {
  const DrowerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 50, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40.r,
            child: SvgPicture.asset(AppSvgs.userProfil),
          ),
          verticalSpace(20),
          BlocBuilder<UserDataCubit, UserDataState>(
            builder: (context, state) {
              if (state is UserDataInitial) {
                return const Text("No data");
              } else if (state is UserDataLoading) {
                return const CircularProgressIndicator();
              } else if (state is UserDataError) {
                return Text("Error: ${state.message}");
              } else if (state is UserDataSuccess) {
                final user = state.user;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.firstName} ${user.lastName}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink(); // fallback
            },
          ),
          SizedBox(height: 20),
          CustomListTitleWidget(
            icon: Icons.favorite_border_outlined,
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
