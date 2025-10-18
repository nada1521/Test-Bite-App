import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/feature/search/view/widgets/search_list_result.dart';
import '../../../../core/widgets/search_text_field_widget.dart';
import '../../logic/searchbyletter_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Search Dishes") ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchTextFieldWidget(
                onChanged: (input) {
                  context.read<SearchbyletterCubit>().searchByFirstLetter();
                },
                hintText: "search",
                prefixIcon: Icons.search,
                controller: context
                    .read<SearchbyletterCubit>()
                    .searchController,
              ),
            ),
            SearchListWidget(),
          ],
        ),
      ),
    );
  }
}
