import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import '../../home/view/screens/menue_screen.dart';

import 'drower_widget.dart';

class HomeAndDrawerAnimatedScreen extends StatefulWidget {
  const HomeAndDrawerAnimatedScreen({super.key, this.countryName});
  final String? countryName;
  @override
  State<HomeAndDrawerAnimatedScreen> createState() =>
      _HomeAndDrawerAnimatedScreenState();
}

class _HomeAndDrawerAnimatedScreenState
    extends State<HomeAndDrawerAnimatedScreen> {
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DrowerWidget(),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            transform:
                Matrix4.translationValues(
                  isDrawerOpen ? 200 : 0,
                  isDrawerOpen ? 70 : 0,
                  0,
                )..scaleByVector3(
                  Vector3(isDrawerOpen ? 0.8 : 1, isDrawerOpen ? 0.8 : 1, 1),
                ),
            clipBehavior: Clip.antiAlias, // مهم عشان الـ borderRadius يشتغل
            decoration: BoxDecoration(
              color: NewAppColors.white, // يغطي أي خلفية من تحت
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20.r : 0),
              boxShadow: [
                if (isDrawerOpen)
                  BoxShadow(
                    color: NewAppColors.black12,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 5),
                  ),
              ],
            ),
            child: GestureDetector(
              onTap: () {
                if (isDrawerOpen) {
                  setState(() {
                    isDrawerOpen = false; // يقفل الـ Drawer
                  });
                }
              },
              // عشان لما اضغط ع الايكون تشتغل و الكليك توصل
              child: AbsorbPointer(
                absorbing:
                    isDrawerOpen, // لما Drawer مفتوح يمنع الـ taps توصل للـ MenueScreen
                child: MenueScreen(
                  countryName: widget.countryName,
                  onPressed: () {
                    setState(() {
                      isDrawerOpen = true;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
