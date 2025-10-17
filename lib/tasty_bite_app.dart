import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
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
            fontFamily: AppConstants.fontName,
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
            appBarTheme: AppBarTheme(backgroundColor: AppColors.appbarColor),
          ),
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          // initialRoute: isLoggedInUser ? AppRoutes.bottomNavBar : AppRoutes.signUpScreen,
          initialRoute: AppRoutes.loginScreen,
          onGenerateRoute: AppRouter().generatRoute,
        );
      },
    );
  }
}
