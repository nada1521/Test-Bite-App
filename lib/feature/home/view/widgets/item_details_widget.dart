import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/models/item_details_response_model.dart';
import 'add_to_favorit_screen_widget.dart';
import 'exbanded_button_widget.dart';
import 'rich_text_string_widget.dart';
import 'video_widget.dart';

class ItemDetailsWidget extends StatefulWidget {
  const ItemDetailsWidget({super.key, required this.itemDetails});
  final ItemDetailsModel itemDetails;

  @override
  State<ItemDetailsWidget> createState() => _ItemDetailsWidgetState();
}

class _ItemDetailsWidgetState extends State<ItemDetailsWidget> {
  bool isDescriptionSelected = false;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ExpandedButtonWidget(
                  onPressed: () {
                    setState(() {
                      isDescriptionSelected = false;
                    });
                  },
                  title: LocaleKeys.home_screen_over_view.tr(),
                  isDescriptionSelected: !isDescriptionSelected,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(12),
                    bottomStart: Radius.circular(12),
                  ),
                ),
                ExpandedButtonWidget(
                  onPressed: () {
                    setState(() {
                      isDescriptionSelected = true;
                    });
                  },
                  title: LocaleKeys.home_screen_how_to_make.tr(),
                  isDescriptionSelected: isDescriptionSelected,
                ),
              ],
            ),
            verticalSpace(15),
            isDescriptionSelected
                ? Text(
                    widget.itemDetails.strInstructions,
                    style: AppTextStyle.fontWeightW500Size18TextSecondColor,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichTextWidgetString(
                        widget: widget,
                        title1: LocaleKeys.home_screen_this_dish_belongs_to
                            .tr(),
                        title2: widget.itemDetails.strCategory,
                      ),
                      verticalSpace(10),
                      RichTextWidgetString(
                        title1: LocaleKeys.home_screen_from_country.tr(),
                        title2: widget.itemDetails.strArea,
                        widget: widget,
                      ),
                      verticalSpace(10),
                      VideoWidget(
                        videoUrl:
                            widget.itemDetails.strYoutube ??
                            LocaleKeys.home_screen_no_link.tr(),
                      ),
                      AddToFavoritScreen(itemMenuModel: widget.itemDetails),
                      // TextButton.icon(
                      //   onPressed: () async {
                      //     final url = Uri.parse(
                      //       widget.itemDetails.strYoutube ?? "No Link",
                      //     );
                      //     if (await canLaunchUrl(url)) {
                      //       await launchUrl(
                      //         url,
                      //         mode: LaunchMode.externalApplication,
                      //       );
                      //     }
                      //   },
                      //   icon: Icon(Icons.play_circle_fill, color: Colors.red),
                      //   label: Text(
                      //     "Watch on YouTube",
                      //     style: AppTextStyle.fontWeightW600Size15,
                      //   ),
                      // ),
                      verticalSpace(20),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
