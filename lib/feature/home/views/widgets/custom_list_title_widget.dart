import 'package:flutter/material.dart';
import '../../../../core/utils/app_text_style.dart';

class CustomListTitleWidget extends StatelessWidget {
  const CustomListTitleWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon),
        title: Text(
          title,
          style: AppTextStyle.fontWeightW600Size17ColorTextMain,
        ),
      ),
    );
  }
}
