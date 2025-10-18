part of 'category_cubit.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;

  CategorySuccess({required this.categories});
}

class CategoryFailure extends CategoryState {
  final String error;

  CategoryFailure({required this.error});
}

class CountryLoading extends CategoryState {}

class CountrySuccess extends CategoryState {
  final List<ItemMenuModel> categories;

  CountrySuccess({required this.categories});
}

class CountryFailure extends CategoryState {
  final String error;

  CountryFailure({required this.error});
}
