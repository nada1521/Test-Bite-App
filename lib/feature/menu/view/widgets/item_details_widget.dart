import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/feature/menu/view/screens/item_details_screen.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/models/item_details_response_model.dart';
import 'add_to_favorit_screen_widget.dart';

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
                    style: AppTextStyle.fontWeightNormalSize17TextClickable,
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

class RichTextWidgetString extends StatelessWidget {
  const RichTextWidgetString({
    super.key,
    required this.widget,
    required this.title1,
    required this.title2,
  });

  final ItemDetailsWidget widget;
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title1,
        style: AppTextStyle.fontWeightnormalSize16ColorTextSecond,
        children: [
          TextSpan(
            text: title2,
            style: AppTextStyle.fontWeightW400Size18TextSecondColor,
          ),
        ],
      ),
    );
  }
}

class ExpandedButtonWidget extends StatelessWidget {
  const ExpandedButtonWidget({
    super.key,
    required this.title,
    required this.isDescriptionSelected,
    this.borderRadius,
    required this.onPressed,
  });
  final String title;
  final bool isDescriptionSelected;
  final BorderRadius? borderRadius;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: isDescriptionSelected ? Colors.brown[900] : Colors.brown[500],
          borderRadius:
              borderRadius ??
              const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(title, style: AppTextStyle.fontSize14Bold),
        ),
      ),
    );
  }
}
