import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/helper/navigation/push_to.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/router/app_router_path.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/generated/tr_locale_keys.g.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../logic/sign_up_cubit.dart';

class OtpRegisteredSuccessfullyWidget extends StatelessWidget {
  const OtpRegisteredSuccessfullyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(AppAssets.successImage, width: 120.w, height: 120.h),
        verticalSpace(10),
        Text(
          LocaleKeys.otp_congratulations.tr(),
          style: AppTextStyle.fontSize14Bold.copyWith(
            color: AppColors.mainColor,
          ),
        ),
        verticalSpace(8),
        Text(
          LocaleKeys.otp_account_created_successfully.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyle.fontWeightW400Size18TextSecondColor,
        ),
        verticalSpace(10),
        CustomButton(
          onTap: () {
            Navigator.pop(context);
            pushReplacementNamed(
              context,
              AppRoutes.drowerScreen,
              arguments: getIt<SignupCubit>().countryController.text,
            );
          },
          title: LocaleKeys.otp_go_to_home.tr(),
        ),
      ],
    );
  }
}
