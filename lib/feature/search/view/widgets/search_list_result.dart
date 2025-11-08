import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
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
                EmptyPlaceholderText(title:LocaleKeys.search_screen_no_results.tr()),
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
                title: LocaleKeys.search_screen_start_searching.tr(),
              ),
            ],
          );
        }
        return CustomProgressIndecator(color: NewAppColors.primary);
      },
    );
  }
}
