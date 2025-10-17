import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import 'package:tasty_bite/core/widgets/custom_progress_indecator.dart';
import '../../data/models/category_menu_respons_model.dart';
import '../logic/failter_category/failter_category_cubit.dart';
import '../logic/failter_category/failter_category_state.dart';
import '../widgets/item_widget_menu_item_screen.dart';
import '../widgets/menu_item_appbar.dart';

class MenuItemScreen extends StatefulWidget {
  const MenuItemScreen({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<MenuItemScreen> createState() => _MenuItemScreenState();
}

class _MenuItemScreenState extends State<MenuItemScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuItemAppbar(categoryModel: widget.categoryModel),
      body: BlocBuilder<FailterCategoryCubit, FailterCategoryState>(
        builder: (context, state) {
          if (state is FailterCategorySuccess) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return ItemWidget(itemMenu: state.categories[index]);
              },
            );
          } else if (state is FailterCategoryFailure) {
            return Center(child: Text(state.error));
          }
          return const CustomProgressIndecator(color: NewAppColors.primary,);
        },
      ),
    );
  }
}
