import 'package:bloc/bloc.dart';
import 'package:tasty_bite/core/Networking/local_database/helper/hive_helper.dart';
import '../../../home/data/models/item_details_response_model.dart';
part 'favorit_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  final List<ItemDetailsModel> favorites = [];

  void addItem(ItemDetailsModel item) async {
    if (!favorites.any((fav) => fav.idMeal == item.idMeal)) {
      favorites.add(item);
      await HiveHelper.cacheFavoriteMeal(favorites);
      emit(FavoritesLoaded(List.from(favorites)));
    }
  }
void loadFavorites() async {
  final cachedFavorites = await HiveHelper.getCachedFavoriteMeal();
  favorites.clear();
  favorites.addAll(cachedFavorites);
  if (favorites.isEmpty) {
    emit(NoFavoriteItems());
  } else {
    emit(FavoritesLoaded(List.from(favorites)));
  }
}

  void removItem(ItemDetailsModel item) async {
    favorites.removeWhere((fav) => fav.idMeal == item.idMeal);
    await HiveHelper.cacheFavoriteMeal(favorites);

    if (favorites.isEmpty) {
      emit(NoFavoriteItems());
    } else {
      emit(FavoritesLoaded(List.from(favorites)));
    }
  }

  bool isFavorite(ItemDetailsModel item) {
    return favorites.any((fav) => fav.idMeal == item.idMeal);
  }
}
