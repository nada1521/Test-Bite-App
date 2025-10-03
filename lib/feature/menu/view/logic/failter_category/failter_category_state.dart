
import '../../../data/models/filter_category_response_model.dart';


abstract class FailterCategoryState {}

class FailterCategoryInitial extends FailterCategoryState {}

class FailterCategoryLoading extends FailterCategoryState {}

class FailterCategorySuccess extends FailterCategoryState {
  final List<ItemMenuModel> categories;

  FailterCategorySuccess({required this.categories});
}

class FailterCategoryFailure extends FailterCategoryState {
  final String error;

  FailterCategoryFailure({required this.error});
}
