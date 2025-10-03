import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/router/app_router_path.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/models/filter_category_response_model.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.itemMenu});
  final ItemMenuModel itemMenu;

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
            pushNamed(context, AppRoutes.itemDetails, arguments: itemMenu),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: SizedBox(
                width: 220.w,
                child: Text(
                  itemMenu.itemName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: AppTextStyle.fontWeightRegularSize16TextSecondColor2
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(12.r),
                bottomEnd: Radius.circular(12.r),
              ),
              child: Image.network(
                itemMenu.itemImage,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
