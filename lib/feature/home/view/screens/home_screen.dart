import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../auth/signup/data/user_remote_data_source.dart';
import '../widgets/custom_home_appbar.dart';
import '../widgets/search_container_widget.dart';
import '../widgets/category_horizontal_list.dart';
import '../widgets/menu_list_view_item_widget.dart';
import '../widgets/welcom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onPressed, this.countryName});
  final Function() onPressed;
  final String? countryName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? countryName;

  @override
  void initState() {
    super.initState();
    countryName = widget.countryName ?? "Egyptian";
    getUserCountry().then((coutry) {
      if (coutry != null) {
        setState(() {
          countryName = coutry;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppbar(onPressed: widget.onPressed),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomText(),
              const CategoryHorizontalList(),
              const SearchContainerWidget(),
              Text(
                "${LocaleKeys.home_screen_country_food.tr()}$countryName",
                style: AppTextStyle.fontSize16BoldTextPrimaryColor.copyWith(
                  fontSize: 20.sp,
                ),
              ),
              MenuListViewItem(countryName: countryName ?? "Egyptian"),
              verticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }
}
