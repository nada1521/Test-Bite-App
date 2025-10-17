import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/helper/extensions.dart';
import 'tasty_bite_app.dart';
import 'core/Networking/local_database/helper/hive_helper.dart';
import 'core/di/dependency_injection.dart';
import 'core/router/app_router.dart';
import 'core/utils/app_constants.dart';
import 'core/utils/helper/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await checkIfLoggedInUser();
  await setupGetit();
  // await SupabaseDatabase().initSupabase();
  await HiveHelper.initHive();
  await CacheHelper.init();
  AppRouter appRouter = AppRouter();
  
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      child: TastyBiteApp(appRouter: appRouter),
    ),
  );
}

checkIfLoggedInUser() async {
  String? userToken = await CacheHelper.getSecuredString(
    AppConstants.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
