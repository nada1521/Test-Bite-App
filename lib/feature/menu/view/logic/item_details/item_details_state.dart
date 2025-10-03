
import '../../../data/models/item_details_response_model.dart';

abstract class ItemDetailsState {}

class ItemDetailsInitial extends ItemDetailsState {}

class ItemDetailsLoading extends ItemDetailsState {}

class ItemDetailsSuccess extends ItemDetailsState {
  final List<ItemDetailsModel> categories;

  ItemDetailsSuccess({required this.categories});
}
class ItemDetailsFailure extends ItemDetailsState {
  final String error;

  ItemDetailsFailure({required this.error});
}
