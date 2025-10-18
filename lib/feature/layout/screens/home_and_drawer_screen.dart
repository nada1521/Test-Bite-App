import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import 'package:tasty_bite/feature/layout/widgets/drower_widget.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import '../../home/view/screens/menue_screen.dart';

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

  void _toggleDrawer([bool? open]) {
    setState(() {
      _isDrawerOpen = open ?? !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        
          const DrowerWidget(),

       
          _buildAnimatedMainContent(),
        ],
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
          child: MenueScreen(
            countryName: widget.countryName,
            onPressed: () => _toggleDrawer(true),
          ),
        ),
      ),
    );
  }

  ///  جدول تحويل الانيميشن
  Matrix4 get _drawerTransformMatrix => Matrix4.translationValues(
        _isDrawerOpen ? 200 : 0,
        _isDrawerOpen ? 70 : 0,
        0,
      )..scaleByVector3(
          Vector3(
            _isDrawerOpen ? 0.8 : 1,
            _isDrawerOpen ? 0.8 : 1,
            1,
          ),
        );

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
