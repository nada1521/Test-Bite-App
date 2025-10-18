part of 'search_by_letter_cubit.dart';

abstract class SearchByLetterState {}

class Initial extends SearchByLetterState {}

class Success extends SearchByLetterState {
  List<ItemMenuModel> searchResults;
  Success({required this.searchResults});
}

class Loading extends SearchByLetterState {}

class Failure extends SearchByLetterState {
  final String message;
  Failure(this.message);
}
