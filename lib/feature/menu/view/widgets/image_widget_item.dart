import 'package:flutter/material.dart';
import '../../../../core/helper/navigation/push_to.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/new_app_colors.dart';
import '../screens/image_screen.dart';

class ImageWidgetModel extends StatelessWidget {
  const ImageWidgetModel({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () => pushTo(context, ImageScreen(image: image)),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Image.network(
                image,
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.transparent,
                        AppColors.transparent,
                        NewAppColors.white.withAlpha(200),
                      ],
                    ),
                  ),
                ),
              ),
              // BackContainerWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
