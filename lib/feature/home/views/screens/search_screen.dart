import 'package:flutter/material.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/search_text_field_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Search delicious dishes",
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchTextFieldWidget(
                hintText: "search",
                
                prefixIcon: Icons.search,
                controller: TextEditingController(),
              ),
            ),
            verticalSpace(190),
            Text(
              "Start searching for your favorite dishes 🍽️",
              style: AppTextStyle.fontWeightW500Size18TextSecondColor,
            ),
          ],
        ),
      ),
    );
  }
}
