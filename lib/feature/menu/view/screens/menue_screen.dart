import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../auth/signup/data/user_remote_data_source.dart';
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
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    getUserCountry().then((coutry) {
      setState(() {
        countryName = coutry ?? "Egyptian";
        isLoading = false;
      });
    });
    log(">>> country sent: $countryName");
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: CustomAppbar(onPressed: widget.onPressed, title: "Testy Bite"),
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
                style: AppTextStyle.fontWeightW600Size17ColorTextMain,
              ),
               MenuListViewItem(countryName: countryName??"Egyptian",),
              verticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }
}

// class MenueScreen extends StatefulWidget {
//   const MenueScreen({super.key, required this.onPressed, this.countryName});
//   final Function() onPressed;
//   final String? countryName;
//   @override
//   State<MenueScreen> createState() => _MenueScreenState();
// }

// class _MenueScreenState extends State<MenueScreen> {
//   Future<String?> getUserCountry() async {
//   final uid = FirebaseAuth.instance.currentUser?.uid;
//   if (uid == null) return null;

//   final doc = await FirebaseFirestore.instance.collection("users").doc(uid).get();
//   return doc.data()?["country"];
// }

//   @override
//   void initState() {
//     super.initState();
//     context.read<CategoryCubit>().getItemByCountry(
//       country: widget.countryName?.trim() ?? "Egyptian",

//     );
//     log(">>> country sent: ${widget.countryName}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getUserCountry(),
//       builder: (context, snapshot) {
//          if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     if (!snapshot.hasData) {
//       return MenueScreen(
//         onPressed: () {},
//         countryName: "Egyptian", // default
//       );
//     }
//         return Scaffold(
//           appBar: CustomAppbar(
//             onPressed: widget.onPressed,
//             title: "Cooking around world",
//           ),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   WelcomText(),
//                   FoodHorizontalList(),
//                   SearchContainerWidget(),

//                   Text(
//                     " Country Food",
//                     style: AppTextStyle.fontWeightW600Size17ColorTextMain.copyWith(
//                       backgroundColor: Colors.grey[200],
//                     ),
//                   ),
//                   MenuListViewItem(),
//                   verticalSpace(50),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }
//     );
//   }
// }

class WelcomText extends StatelessWidget {
  const WelcomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.bagelight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.grey),
      ),
      height: 110,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            // height: 100,
            width: 210.w,
            child: Text(
              "Cook, learn, and taste the world – one delicious recipe at a time 🍲🌎",

              style: AppTextStyle.fontWeightW600Size17ColorTextMain,
            ),
          ),
          Image.asset(
            AppAssets.sticar,
            width: 110.w,
            // height: 250,
            fit: BoxFit.cover, // عشان ما تتقصش
          ),
          // Container(
          //   margin: const EdgeInsets.only(bottom: 8, top: 8),
          //   height: 100.h,
          //   width: 200.w,
          //   decoration: BoxDecoration(
          //     color: Colors.amber,
          //     borderRadius: BorderRadiusDirectional.only(
          //       bottomEnd: Radius.circular(30.r),
          //       topEnd: Radius.circular(30.r),
          //     ),
          //   ),
          //   child: SvgPicture.asset(AppSvgs.sticar),
          // ),
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
      title: Text(title, style: AppTextStyle.appbarSize22MainColor),
      actions: [IconButton(onPressed: onPressed, icon: Icon(Icons.person))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
