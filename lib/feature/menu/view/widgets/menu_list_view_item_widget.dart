import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/category_list/category_cubit.dart';
import 'menu_item_widget.dart';

class MenuListViewItem extends StatelessWidget {
  const MenuListViewItem({super.key, required this.countryName});
  final String countryName;
  @override
  Widget build(BuildContext context) {
    context.read<CategoryCubit>().getItemByCountry(country: countryName);

    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          current is CountryLoading ||
          current is CountrySuccess ||
          current is CountryFailure,

      builder: (context, state) {
        if (state is CountrySuccess) {
          var category = state.categories;
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 10),
            shrinkWrap: true,
            itemCount: category.length,
            itemBuilder: (context, index) {
              return MenuItemWidget(categoryMenu: category[index]);
            },
          );
        } else if (state is CountryFailure) {
          return Center(child: Text(state.error));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
