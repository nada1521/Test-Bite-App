import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import 'package:tasty_bite/core/widgets/custom_progress_indecator.dart';
import '../../../home/views/widgets/food_card.dart';
import '../logic/category_list/category_cubit.dart';

class FoodHorizontalList extends StatelessWidget {
  const FoodHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          current is CategorySuccess ||
          current is CategoryLoading ||
          current is CategoryFailure,
      builder: (context, state) {
        if (state is CategorySuccess) {
          return SizedBox(
            height: 150.h,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) =>
                  FoodCard(foodmodel: state.categories[index]),
            ),
          );
        } else if (state is CategoryFailure) {
          return Text(
            state.error,
            style: TextStyle(color: Colors.red, fontSize: 16.sp),
          );
        }
        return SizedBox(
          height: 150.h,
          child: Center(
            child: CustomProgressIndecator(color: NewAppColors.primary),
          ),
        );
      },
    );
  }
}
