import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import 'package:tasty_bite/feature/layout/widgets/drower_widget.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import '../../home/view/screens/home_screen.dart';

class HomeAndDrawerAnimatedScreen extends StatefulWidget {
  const HomeAndDrawerAnimatedScreen({super.key, this.countryName});

  final String? countryName;

  @override
  State<HomeAndDrawerAnimatedScreen> createState() =>
      _HomeAndDrawerAnimatedScreenState();
}

class _HomeAndDrawerAnimatedScreenState
    extends State<HomeAndDrawerAnimatedScreen> {
  bool _isDrawerOpen = false;
  bool get isArabic => Localizations.localeOf(context).languageCode == 'ar';

  void _toggleDrawer([bool? open]) {
    setState(() {
      _isDrawerOpen = open ?? !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [const DrowerWidget(), _buildAnimatedMainContent()],
        ),
      ),
    );
  }

  ///  الأنيميشن الخاص بالواجهة الرئيسية
  Widget _buildAnimatedMainContent() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      transform: _drawerTransformMatrix,
      clipBehavior: Clip.antiAlias,
      decoration: _mainContentDecoration,
      child: GestureDetector(
        onTap: () {
          if (_isDrawerOpen) _toggleDrawer(false);
        },
        child: AbsorbPointer(
          absorbing: _isDrawerOpen,
          child: HomeScreen(
            countryName: widget.countryName,
            onPressed: () => _toggleDrawer(true),
          ),
        ),
      ),
    );
  }

  ///  جدول تحويل الانيميشن
  Matrix4 get _drawerTransformMatrix {
    final double dx;
    if (_isDrawerOpen) {
      dx = isArabic ? -140.0.w : 200.0.w; // فرق المسافة بين اللغتين
    } else {
      dx = 0.0;
    }

    final dy = _isDrawerOpen ? 100.0 : 0.0;

    return Matrix4.translationValues(dx, dy, 0)..scaleByVector3(
      Vector3(_isDrawerOpen ? 0.8 : 1, _isDrawerOpen ? 0.8 : 1, 1),
    );
  }

  /// الانيميشن هيتحرك ازى
  BoxDecoration get _mainContentDecoration => BoxDecoration(
    color: NewAppColors.white,
    borderRadius: BorderRadius.circular(_isDrawerOpen ? 20.r : 0),
    boxShadow: _isDrawerOpen
        ? [
            BoxShadow(
              color: NewAppColors.black12,
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 5),
            ),
          ]
        : [],
  );
}
