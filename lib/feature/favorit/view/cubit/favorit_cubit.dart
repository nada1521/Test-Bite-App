import 'package:bloc/bloc.dart';
import '../../../home/data/models/item_details_response_model.dart';
part 'favorit_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  final List<ItemDetailsModel> favorites = [];

  void addItem(ItemDetailsModel item) {
    if (!favorites.any((fav) => fav.idMeal == item.idMeal)) {
      favorites.add(item);
      emit(FavoritesLoaded(List.from(favorites)));
    }
  }

  void removItem(ItemDetailsModel item) {
    favorites.removeWhere((fav) => fav.idMeal == item.idMeal);

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
