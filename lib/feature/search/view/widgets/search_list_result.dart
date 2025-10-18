import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import 'package:tasty_bite/core/widgets/custom_progress_indecator.dart';
import 'package:tasty_bite/core/widgets/empty_placeholder_text.dart';
import '../../../../core/helper/spacing.dart';
import '../../logic/search_by_letter_cubit.dart';
import 'search_list_view.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchByLetterCubit, SearchByLetterState>(
      builder: (context, state) {
        if (state is Success) {
          if (state.searchResults.isEmpty) {
            return Column(
              children: [
                verticalSpace(190),
                EmptyPlaceholderText(title: "No results found 🍽️"),
              ],
            );
          } else {
            return SearchListView(searchResult: state.searchResults);
          }
        } else if (state is Failure) {
          return Text(state.message);
        } else if (state is Initial) {
          return Column(
            children: [
              verticalSpace(200),
              EmptyPlaceholderText(
                title: "Start searching for your favorite dishes 🍽️",
              ),
            ],
          );
        }
        return CustomProgressIndecator(color: NewAppColors.primary);
      },
    );
  }
}
