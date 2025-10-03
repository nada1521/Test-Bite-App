import 'dart:io';

import 'package:flutter/material.dart';

abstract class AppNavigator {
  static final _duration = const Duration(milliseconds: 250);
  static final _tweenSlide = Tween(
    begin: const Offset(1, 0),
    end: const Offset(0, 0),
  ).chain(CurveTween(curve: Curves.easeInOut));

  static Future<T?> pushSlideX<T>(BuildContext context, Widget screen) async {
    /**
        Avoid using Custom Transition for iOS as it already has built-in animation.
        It is preferred to use `CupertinoPageRoute` in the `MaterialPageRoute` to allow
        iOS features, i.e: Back swipe gesture
     */
    if (Platform.isIOS) return pushTo(context, screen);

    return await Navigator.push<T>(
      context,
      PageRouteBuilder(
        transitionDuration: _duration,
        pageBuilder: (context, anim, anim2) => screen,
        transitionsBuilder: (context, anim, anim2, child) {
          return SlideTransition(
            position: anim.drive(_tweenSlide),
            child: child,
          );
        },
      ),
    );
  }
}

Future<T?> pushTo<T>(BuildContext context, Widget screen) async {
  return await Navigator.push<T>(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

Future<T?> pushNamed<T>(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) async {
  return await Navigator.pushNamed<T>(context, routeName, arguments: arguments);
}

Future pushReplacementNamed<T>(
  BuildContext context,
String routeName, {
  Object? arguments,
}) async {
  return Navigator.pushReplacementNamed(context ,routeName, arguments: arguments);
}
