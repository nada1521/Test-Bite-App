import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../favorit/view/cubit/favorit_cubit.dart';
import '../../data/models/item_details_response_model.dart';

class AddToFavoritScreen extends StatelessWidget {
  const AddToFavoritScreen({super.key, required this.itemMenuModel});
  final ItemDetailsModel itemMenuModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final cubit = context.read<FavoritesCubit>();
        final isFav = cubit.isFavorite(itemMenuModel);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              LocaleKeys.home_screen_add_to_favorit_dishes.tr(),
              style: AppTextStyle.fontWeightBoldSize18TextMedium.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            IconButton(
              onPressed: () {
                if (isFav) {
                  cubit.removItem(itemMenuModel);
                } else {
                  cubit.addItem(itemMenuModel);
                }
              },
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: AppColors.mainColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
