import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/app_text_style.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import 'core/helper/check_states_user.dart';
import 'core/router/app_router.dart';
import 'core/router/app_router_path.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_constants.dart';

class TastyBiteApp extends StatefulWidget {
  const TastyBiteApp({super.key, required this.appRouter});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  final AppRouter appRouter;
  @override
  State<TastyBiteApp> createState() => _TastyBiteAppState();
}

class _TastyBiteAppState extends State<TastyBiteApp> {
  final checkStatesUser = CheckStatesUser();
  bool isLoggedInUser = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    check();
  }

  Future<void> check() async {
    final isLoggedIn = await checkStatesUser.isLoggedIn();
    setState(() {
      isLoggedInUser = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: TastyBiteApp.navigatorKey,
          theme: ThemeData(
            fontFamily: AppConstants.fontNameEnglish,
            fontFamilyFallback: [AppConstants.fontNameArabic],
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
            appBarTheme: AppBarTheme(
              titleTextStyle: AppTextStyle.appbarSize22WhiteColor,
              backgroundColor: NewAppColors.primary,
              iconTheme: IconThemeData(color: NewAppColors.white),
            ),
          ),
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          initialRoute: isLoggedInUser
              ? AppRoutes.drowerScreen
              : AppRoutes.signUpScreen,

          onGenerateRoute: AppRouter().generatRoute,
        );
      },
    );
  }
}
