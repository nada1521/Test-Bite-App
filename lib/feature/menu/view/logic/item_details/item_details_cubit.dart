import 'package:bloc/bloc.dart';
import 'package:tasty_bite/core/Networking/api_result.dart';

import '../../../data/repos/menu_repo.dart';
import 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  ItemDetailsCubit(this.menuRepo) : super(ItemDetailsInitial());
  final MenuRepo menuRepo;
  Future<void> getItemDetails({required String itemID}) async {
    emit(ItemDetailsLoading());
    final data = await menuRepo.getItemDetails(itemId: itemID);
    data.when(
      success: (success) {
        emit(ItemDetailsSuccess(categories: success.meals));
      },
      failure: (failure) {
        emit(ItemDetailsFailure(error: failure.errorMessage));
      },
    );
  }
}
