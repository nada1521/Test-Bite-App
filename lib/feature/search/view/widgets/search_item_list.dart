import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import 'package:tasty_bite/feature/home/data/models/filter_category_response_model.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/router/app_router_path.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/cached_network_image_widget.dart';

class SearchItemList extends StatelessWidget {
  const SearchItemList({super.key, required this.searchResult});
  final ItemMenuModel searchResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: NewAppColors.containerBackgroundColor,
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
              child: CachedNetworkImageWidget(imageUrl: searchResult.itemImage),
            ),
            SizedBox(
              width: 220.w,
              child: Text(
                searchResult.itemName,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: AppTextStyle.fontWeightW400Size18TextDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
