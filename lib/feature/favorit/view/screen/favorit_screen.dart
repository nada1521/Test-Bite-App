import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/router/app_router_path.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../menu/data/models/item_details_response_model.dart';
import '../cubit/favorit_cubit.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Favorite Dishes'),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoaded) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                return FavoritItem(itemDetails: state.favorites[index]);
              },
            );
          }
          return Center(
            child: Text(
              "There are no favorite dishes yet.",
              style: AppTextStyle.fontWeightnormalSize16ColorTextSecond,
            ),
          );
        },
      ),
    );
  }
}

class FavoritItem extends StatelessWidget {
  const FavoritItem({super.key, required this.itemDetails});
  final ItemDetailsModel itemDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
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
                  style: AppTextStyle.fontWeightW400Size18TextSecondColor
                      .copyWith(fontWeight: FontWeight.bold),
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
                  color: AppColors.clickableTextColor,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
