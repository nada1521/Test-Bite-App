// import 'package:asmaq_thraa/core/helper/spacing.dart';
// import 'package:asmaq_thraa/features/home/views/widgets/search_container_widget.dart';
// import 'package:flutter/material.dart';
// import '../widgets/best_saler_list_view.dart';
// import '../widgets/home_appbar_widget.dart';
// import '../widgets/services_widget.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key,});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: HomeAppbarWidget(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SearchContainerWidget(),
//             ServicesWidget(),
//             // BestSalerListView(),
//             verticalSpace(90),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import '../../../../core/utils/app_colors.dart';
import '../../../menu/view/screens/menue_screen.dart';
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
              color: Colors.white, // يغطي أي خلفية من تحت
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
              boxShadow: [
                if (isDrawerOpen)
                  BoxShadow(
                    color: AppColors.black12,
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
