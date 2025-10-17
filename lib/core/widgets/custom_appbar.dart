import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.title, this.centerTitle = true});
  final String title;
  final bool centerTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTextStyle.appbarSize22WhiteColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
