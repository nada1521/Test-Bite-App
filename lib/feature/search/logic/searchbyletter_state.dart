part of 'searchbyletter_cubit.dart';

abstract class SearchbyletterState {}

class Initial extends SearchbyletterState {}

class Success extends SearchbyletterState {
  List<ItemMenuModel> searchResults;
  Success({required this.searchResults});
}

class Loading extends SearchbyletterState {}

class Failure extends SearchbyletterState {
    final String message;
  Failure(this.message); 
}
