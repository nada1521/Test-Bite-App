import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/router/app_router_path.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/models/filter_category_response_model.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({super.key, required this.categoryMenu});
  final ItemMenuModel categoryMenu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNamed(context, AppRoutes.itemDetails, arguments: categoryMenu);
      },
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            height: 90.h,
            width: 280.w,
            decoration: BoxDecoration(
              color: NewAppColors.containerBackgroundColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: categoryMenu.itemImage,
                transitionOnUserGestures: true,
                child: CircleAvatar(
                  radius: 50.r,
                  backgroundImage: CachedNetworkImageProvider(
                    categoryMenu.itemImage,
                  ),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: categoryMenu.itemName,
                      child: Material(
                        color: NewAppColors.transparent,
                        child: Text(
                          categoryMenu.itemName,
                          style: AppTextStyle.fontWeightBoldSize18TextMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              horizontalSpace(100),
            ],
          ),
        ],
      ),
    );
  }
}
