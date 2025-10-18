import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

class EmptyPlaceholderText extends StatelessWidget {
  const EmptyPlaceholderText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: AppTextStyle.fontWeightnormalSize16ColorTextDark,
      ),
    );
  }
}
