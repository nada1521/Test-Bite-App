import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/router/app_router_path.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../home/data/models/item_details_response_model.dart';
import '../cubit/favorit_cubit.dart';

class FavoritItem extends StatelessWidget {
  const FavoritItem({super.key, required this.itemDetails});
  final ItemDetailsModel itemDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
      decoration: BoxDecoration(
        color: NewAppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: InkWell(
        onTap: () =>
            pushNamed(context, AppRoutes.itemDetails, arguments: itemDetails),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(12.r),
                bottomStart: Radius.circular(12.r),
              ),
              child: Image.network(
                itemDetails.strMealThumb,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: SizedBox(
                width: 180.w,
                child: Text(
                  itemDetails.strMeal,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: AppTextStyle.fontWeightBoldSize18TextMedium,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: IconButton(
                onPressed: () {
                  context.read<FavoritesCubit>().removItem(itemDetails);
                },
                icon: Icon(
                  Icons.delete,
                  color: NewAppColors.disabled,
                  size: 22.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
