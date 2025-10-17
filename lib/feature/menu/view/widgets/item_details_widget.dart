import 'package:flutter/material.dart';
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
                  title: "Overview",
                  isDescriptionSelected: !isDescriptionSelected,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                ExpandedButtonWidget(
                  onPressed: () {
                    setState(() {
                      isDescriptionSelected = true;
                    });
                  },
                  title: "Preparation method",
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
                        title1: "This dish belongs to: ",
                        title2: widget.itemDetails.strCategory,
                      ),
                      verticalSpace(10),
                      RichTextWidgetString(
                        title1: "This food is from the country ",
                        title2: widget.itemDetails.strArea,
                        widget: widget,
                      ),
                      verticalSpace(10),
                      VideoWidget(
                        videoUrl: widget.itemDetails.strYoutube ?? "No link !",
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
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
