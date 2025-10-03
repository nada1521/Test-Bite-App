// import 'package:app_links/app_links.dart';
// import 'package:asmaq_thraa/asmaq_thraa_app.dart';
// import 'package:asmaq_thraa/features/home/views/screens/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DeepLinksManager {
//   DeepLinksManager._();
//   static void handleDeepLink() {
//     final appLinks = AppLinks();
//     appLinks.uriLinkStream.listen((uri) {
//       if (uri.host == 'signin-with-magic-link') {
//         pushToValidationUserDataAndDoSignup();
//       }
//     });
//   }

//   static void pushToValidationUserDataAndDoSignup() {
//     AsmaqthraaApp.navigatorKey.currentState?.pushAndRemoveUntil(
//       MaterialPageRoute(
//         builder: (BuildContext context) => MultiBlocProvider(
//           providers: [
//             // BlocProvider(
//             //   create: (context) => getIt<SignUpCubit>()..emitSignupStates(),
//             // ),
//             // BlocProvider(
//             //   create: (context) => getIt<HomeCubit>(),
//             // ),
//           ],
//           // child: const HomeScreen(),
//         ),
//       ),
//       (route) => false,
//     );
//   }
// }
