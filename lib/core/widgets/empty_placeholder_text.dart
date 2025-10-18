import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

class EmptyPlaceholderText extends StatelessWidget {
  const EmptyPlaceholderText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.fontWeightnormalSize16ColorTextDark,
        ),
      ),
    );
  }
}
