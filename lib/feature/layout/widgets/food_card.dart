import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/navigation/push_to.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/router/app_router_path.dart';
import '../../../core/utils/app_text_style.dart';
import '../../home/data/models/category_menu_respons_model.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, required this.foodmodel});
  final CategoryModel foodmodel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          pushNamed(context, AppRoutes.menueItem, arguments: foodmodel),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: CircleAvatar(
              maxRadius: 50.r,
              backgroundImage: NetworkImage(foodmodel.categoryImage),
            ),
          ),
          verticalSpace(10),
          Text(
            foodmodel.categoryName,
            style: AppTextStyle.fontWeightBoldSize18TextMedium,
          ),
        ],
      ),
    );
  }
}
