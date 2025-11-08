import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/come_eat_app.dart';
import 'package:tasty_bite/core/helper/check_states_user.dart';
import 'package:tasty_bite/core/helper/navigation/push_to.dart';
import 'package:tasty_bite/core/router/app_router_path.dart';
import 'package:tasty_bite/core/utils/common/languages.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_list_title_widget.dart';

class SettingsOptionsWidget extends StatelessWidget {
  const SettingsOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => getSettingsOption(context)[index],
        separatorBuilder: (context, index) => verticalSpace(10),
        itemCount: getSettingsOption(context).length,
      ),
    );
  }
}

List<CustomListTitleWidget> getSettingsOption(BuildContext context) {
  final CheckStatesUser checkStatesUser = CheckStatesUser();
  return [
    CustomListTitleWidget(
      icon: Icons.language,
      title: context.locale.languageCode == 'en' ? 'English' : 'العربية',
      onTap: () async {
        final currentLocale = context.locale.languageCode;
        final newLocale = currentLocale == 'en'
            ? const Locale('ar')
            : const Locale('en');

        await Language.changeLanguage(context, locale: newLocale);
      ComeEatApp.navigatorKey.currentState!.pushNamedAndRemoveUntil(
  AppRoutes.homeAndDrowerScreen,
  (route) => false,
);
      },
    ),
    CustomListTitleWidget(
      icon: Icons.lock_outline,
      title: LocaleKeys.change_password_screen_change_password.tr(),
      onTap: () {
        pushNamed(context, AppRoutes.changePasswordScreen);
      },
    ),

    CustomListTitleWidget(
      icon: Icons.logout,
      title: LocaleKeys.auth_label_logout.tr(),
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        await checkStatesUser.logOut();
        // ignore: use_build_context_synchronously
        pushReplacementNamed(context, AppRoutes.loginScreen);
      },
    ),
  ];
}
// class ChangeLanguageButton extends StatelessWidget {
//   final void Function(Locale)? onLanguageChanged;

//   const ChangeLanguageButton({super.key, this.onLanguageChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
//       child: InkWell(
//         onTap: () async {
//           final currentLocale = context.locale.languageCode;
//           final newLocale =
//               currentLocale == 'en' ? const Locale('ar')  : const Locale('en');

//           await Language.changeLanguage(context, locale: newLocale);

//           /// 🔥 Callback here
//           onLanguageChanged?.call(newLocale);
//         },
//         child: Text(
//           context.locale.languageCode == 'en' ? 'English'
//           : 'العربية' ,
//           style: AppTextStyle.fontSize16BoldTextPrimaryColor
//               .copyWith(
//             fontSize: 14,
//           ),
//         ),
//       ),
//     );
//   }
// }
