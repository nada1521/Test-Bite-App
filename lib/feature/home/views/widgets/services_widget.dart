import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/models/image_and_title_model.dart';
import 'category_list.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            "Services",
            style: AppTextStyle.fontWeightW600Size20ColorTextMain,
          ),
        ),
        ServiceshorizntalList(categoryList: categoryList),
      ],
    );
  }
}

List<ImageAndTitleModel> categoryList = [
  ImageAndTitleModel(
    title: 'قاعة كبار الشخصيات VIP',
    image:
        'https://www.thisiscairo.com/wp-content/uploads/2023/10/image-68.png',
  ),
  ImageAndTitleModel(
    title: ' توصيل المنزل ',
    image:
        "https://tiqny.com/wp-content/uploads/2021/12/%D8%A3%D9%81%D8%B6%D9%84-%D8%A8%D8%B1%D9%86%D8%A7%D9%85%D8%AC-%D8%AA%D9%88%D8%B5%D9%8A%D9%84-%D8%B7%D9%84%D8%A8%D8%A7%D8%AA.jpg",
  ),
  ImageAndTitleModel(
    title: 'احجز اجتماع',
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQznvURVnpLqasXFftH2MSZhAGrxIThm95T8g&s",
  ),
  ImageAndTitleModel(
    title: 'تراس',
    image:
        'https://blog.bayut.sa/uploads/2020/08/%D9%85%D8%B7%D8%B9%D9%85-%D8%A3%D8%B3%D9%85%D8%A7%D9%83AR08262020-1024x640.jpg',
  ),
];
