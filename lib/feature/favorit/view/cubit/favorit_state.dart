part of 'favorit_cubit.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class NoFavoriteItems extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<ItemDetailsModel> favorites;
  FavoritesLoaded(this.favorites);
}
