import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/router/app_router_path.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/models/category_menu_respons_model.dart';

class CategoryItemCard extends StatelessWidget {
  const CategoryItemCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushNamed(context, AppRoutes.menueItem, arguments: category),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: CircleAvatar(
              maxRadius: 50.r,
              backgroundImage: CachedNetworkImageProvider(
                category.categoryImage,
              ),
                ),
          ),
          verticalSpace(10),
          Text(
            category.categoryName,
            style: AppTextStyle.fontWeightBoldSize18TextMedium,
          ),
        ],
      ),
    );
  }
}
