import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/feature/menu/data/models/filter_category_response_model.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/router/app_router_path.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';

class ItemListSearch extends StatelessWidget {
  const ItemListSearch({super.key, required this.searchResult});
  final ItemMenuModel searchResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: InkWell(
        onTap: () =>
            pushNamed(context, AppRoutes.itemDetails, arguments: searchResult),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(12.r),
                bottomStart: Radius.circular(12.r),
              ),
              child: Image.network(
                searchResult.itemImage,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 1),
              child: SizedBox(
                width: 220.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      searchResult.itemName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: AppTextStyle
                          .fontWeightRegularSize16TextSecondColor2
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
