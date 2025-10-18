import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../core/Networking/api_result.dart';
import '../../home/data/models/filter_category_response_model.dart';
import '../../home/data/repos/menu_repo.dart';

part 'search_by_letter_state.dart';

class SearchByLetterCubit extends Cubit<SearchByLetterState> {
  SearchByLetterCubit(this.menuRepo) : super(Initial());
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
