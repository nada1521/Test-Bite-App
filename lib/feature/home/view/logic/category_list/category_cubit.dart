import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:tasty_bite/core/Networking/api_result.dart';
import '../../../data/models/category_menu_respons_model.dart';
import '../../../data/models/filter_category_response_model.dart';
import '../../../data/repos/menu_repo.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.menuRepo) : super(CategoryInitial());
  final MenuRepo menuRepo;
  Future<void> getAllCategory() async {
    emit(CategoryLoading());
    final data = await menuRepo.getCategoryList();

    data.when(
      success: (success) {
        emit(CategorySuccess(categories: success.categories));
      },
      failure: (failure) {
        emit(CategoryFailure(error: failure.errorMessage));
      },
    );
  }

  Future<void> getItemByCountry({required String country}) async {
    emit(CountryLoading());
    final data = await menuRepo.getItemByCountry(country: country);
    log("country cubit $country");
    data.when(
      success: (success) {
        emit(CountrySuccess(categories: success.meals));
      },
      failure: (failure) {
        emit(CountryFailure(error: failure.errorMessage));
      },
    );
  }
}
