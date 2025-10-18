import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../auth/signup/data/user_remote_data_source.dart';
import '../../../home/data/models/get_user_data.dart';
import '../../../home/views/widgets/search_container_widget.dart';
import '../widgets/food_horizontal_list.dart';
import '../widgets/menu_list_view_item_widget.dart';

class MenueScreen extends StatefulWidget {
  const MenueScreen({super.key, required this.onPressed, this.countryName});
  final Function() onPressed;
  final String? countryName;

  @override
  State<MenueScreen> createState() => _MenueScreenState();
}

class _MenueScreenState extends State<MenueScreen> {
  String? countryName;
  String userName = "";
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

    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final name = await GetUserData.getUserName();
    if (mounted) {
      setState(() {
        userName = name ?? "Guest";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPressed: widget.onPressed,
        title: "Hello, $userName",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomText(),
              const FoodHorizontalList(),
              const SearchContainerWidget(),
              Text(
                " Country Food",
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

class WelcomText extends StatelessWidget {
  const WelcomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.bagelight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey),
      ),

      height: 110.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 190.w,
            child: Text(
              "Cook, learn, and taste the world - one delicious recipe at a time 🍲🌎",

              style: AppTextStyle.fontWeightW600Size17ColorTextPrimaryColor,
            ),
          ),
          Image.asset(
            AppAssets.sticar,
            width: 120.w,
            // height: 250,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.centerTitle = true,
    required this.onPressed,
  });
  final String title;
  final bool centerTitle;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: NewAppColors.primary,
      title: Text(title, style: AppTextStyle.appbarSize22WhiteColor),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.person, color: NewAppColors.white),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
