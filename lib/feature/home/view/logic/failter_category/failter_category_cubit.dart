import 'package:bloc/bloc.dart';
import 'package:tasty_bite/core/Networking/api_result.dart';
import 'package:tasty_bite/core/helper/internet_conection.dart';
import '../../../data/repos/menu_repo.dart';
import 'failter_category_state.dart';

class FailterCategoryCubit extends Cubit<FailterCategoryState> {
  FailterCategoryCubit(this.menuRepo) : super(FailterCategoryInitial());
  final MenuRepo menuRepo;
  Future<void> getAllCategory({required String categoryName}) async {
    bool online = await NetworkInfo.isConnected();

    if (online) {
  emit(FailterCategoryLoading());
  final data = await menuRepo.getFilterCategory(categoryName: categoryName);
  
  data.when(
    success: (success) {
      emit(FailterCategorySuccess(categories: success.meals));
    },
    failure: (failure) {
      emit(FailterCategoryFailure(error: failure.errorMessage));
    },
  );
}
  }
}
