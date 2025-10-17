import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import 'package:tasty_bite/core/widgets/custom_progress_indecator.dart';
import 'package:tasty_bite/feature/home/views/logic/searchbyletter_cubit.dart';
import 'package:tasty_bite/feature/home/views/widgets/item_list_search.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/utils/app_text_style.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchbyletterCubit, SearchbyletterState>(
      builder: (context, state) {
        if (state is Success) {
          if (state.searchResults.isEmpty) {
            return Column(
              children: [
                verticalSpace(190),
                Text(
                  "No results found 🍽️",
                  style: AppTextStyle.fontWeightW500Size18TextSecondColor,
                ),
              ],
            );
          } else {
            return SizedBox(
              height: 800.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.searchResults.length,
                itemBuilder: (context, index) =>
                    ItemListSearch(searchResult: state.searchResults[index]),
              ),
            );
          }
        } else if (state is Failure) {
          return Text(state.message);
        } else if (state is Initial) {
          return Column(
            children: [
              verticalSpace(200),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Start searching for your favorite dishes 🍽️",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.fontWeightW500Size18TextSecondColor,
                ),
              ),
            ],
          );
        }
        return CustomProgressIndecator(color: NewAppColors.primary);
      },
    );
  }
}
