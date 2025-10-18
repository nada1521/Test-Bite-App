import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/data/models/filter_category_response_model.dart';
import 'search_item_list.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key, required this.searchResult});
  final List<ItemMenuModel> searchResult;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: searchResult.length,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        itemBuilder: (context, index) =>
            SearchItemList(searchResult: searchResult[index]),
      ),
    );
  }
}
