import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_item.dart';
import '../../data/models/image_and_title_model.dart';

class ServiceshorizntalList extends StatelessWidget {
  const ServiceshorizntalList({super.key, required this.categoryList});
  final List<ImageAndTitleModel> categoryList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       height: 175.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) =>
           CategoryItem(imageAndTitleModel: categoryList[index]),
    
      ),
    );
  }
}
