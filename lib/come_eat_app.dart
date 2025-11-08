import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/helper/theme/app_light_them.dart';
import 'core/helper/check_states_user.dart';
import 'core/router/app_router.dart';
import 'core/router/app_router_path.dart';

class ComeEatApp extends StatefulWidget {
  const ComeEatApp({super.key, required this.appRouter});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  final AppRouter appRouter;
  @override
  State<ComeEatApp> createState() => _ComeEatAppState();
}

class _ComeEatAppState extends State<ComeEatApp> {
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
          navigatorKey: ComeEatApp.navigatorKey,
          theme: AppLightTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          initialRoute: isLoggedInUser
              ? AppRoutes.homeAndDrowerScreen
              : AppRoutes.signUpScreen,

          onGenerateRoute: AppRouter().generatRoute,
        );
      },
    );
  }
}
