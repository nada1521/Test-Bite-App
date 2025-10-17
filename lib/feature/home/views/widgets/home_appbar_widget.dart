import 'package:flutter/material.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../settings/view/screens/setings_screen.dart';

class HomeAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Tasty food for you abdo',
        style: AppTextStyle.fontSize32BoldTextPrimaryColor.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            pushTo(context, SetingsScreen());
          },
          icon: Icon(Icons.person),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
