import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasty_bite/core/utils/generated/tr_locale_keys.g.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import '../../logic/search_by_letter_cubit.dart';
import '../../../../core/utils/app_text_style.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: context.read<SearchByLetterCubit>().searchController,

        onChanged: (input) {
          context.read<SearchByLetterCubit>().searchByFirstLetter();
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText:LocaleKeys.search_screen_search.tr(),
          hintStyle: AppTextStyle.fontWeightW500Size18TextSecondColor,

          fillColor: NewAppColors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18.r),
          ),
        ),
      ),
    );
  }
}
