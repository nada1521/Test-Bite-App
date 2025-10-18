import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import 'package:tasty_bite/core/widgets/custom_progress_indecator.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../data/models/filter_category_response_model.dart';
import '../logic/item_details/item_details_cubit.dart';
import '../logic/item_details/item_details_state.dart';
import '../widgets/image_widget_item.dart';
import '../widgets/item_details_widget.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key, required this.itemDetails});
  final ItemMenuModel itemDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
          builder: (context, state) {
            if (state is ItemDetailsSuccess) {
              final item = state.categories[0];
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: MediaQuery.of(context).size.height * 0.5,
                    pinned: true,
                    stretch: true,
                    leading: Container(
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: NewAppColors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    flexibleSpace: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        final bool isCollapsed =
                            constraints.maxHeight <= kToolbarHeight + 50;

                        return FlexibleSpaceBar(
                          titlePadding: const EdgeInsets.only(
                            left: 50,
                            bottom: 15,
                          ),
                          centerTitle: false,
                          title: Text(
                            item.strMeal,
                            style: isCollapsed
                                ? AppTextStyle
                                      .appbarSize22WhiteColor // لما الأب بار يصغر
                                : AppTextStyle
                                      .fontWeightW700Size18ColorPrimary, // لما يكون موسّع
                          ),
                          background: ImageWidgetModel(
                            image: item.strMealThumb,
                          ),
                        );
                      },
                    ),
                  ),

                  ItemDetailsWidget(itemDetails: item),
                ],
              );
            } else if (state is ItemDetailsFailure) {
              return Center(child: Text(state.error));
            }
            return const CustomProgressIndecator(color: NewAppColors.primary,);
          },
        ),
      ),
    );
  }
}
