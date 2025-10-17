import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tasty_bite/feature/menu/data/models/filter_category_response_model.dart';

import '../../../../core/Networking/api_result.dart';
import '../../../menu/data/repos/menu_repo.dart';

part 'searchbyletter_state.dart';

class SearchbyletterCubit extends Cubit<SearchbyletterState> {
  SearchbyletterCubit(this.menuRepo) : super(Initial());
  final MenuRepo menuRepo;
  TextEditingController searchController = TextEditingController();
  List<ItemMenuModel> searchResults = [];
  Future<void> searchByFirstLetter() async {
    final input = searchController.text;
    if (input.isEmpty) {
      searchResults = [];
      emit(Success(searchResults: []));
      return;
    }
    emit(Loading());
    final data = await menuRepo.searchForFirstLetter(firstLetter: input);

    data.when(
      success: (data) {
        emit(Success(searchResults: data.meals));
      },
      failure: (failure) {
        emit(Failure(failure.errorMessage));
      },
    );
  }
}
