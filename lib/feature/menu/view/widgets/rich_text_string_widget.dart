import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_style.dart';
import 'item_details_widget.dart';

class RichTextWidgetString extends StatelessWidget {
  const RichTextWidgetString({
    super.key,
    required this.widget,
    required this.title1,
    required this.title2,
  });

  final ItemDetailsWidget widget;
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title1,
        style: AppTextStyle.fontWeightnormalSize16ColorTextDark,
        children: [
          TextSpan(
            text: title2,
            style: AppTextStyle.fontWeightW700Size18ColorPrimary,
          ),
        ],
      ),
    );
  }
}
