import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/models/category_menu_respons_model.dart';

class MenuItemAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MenuItemAppbar({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NewAppColors.primary,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: NewAppColors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),

      title: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: NetworkImage(categoryModel.categoryImage),
          ),
          horizontalSpace(10),
          Text(
            categoryModel.categoryName,
            style: AppTextStyle.appbarSize22WhiteColor,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
