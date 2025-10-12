import '../../../../core/Networking/api_result.dart';
import '../../../../core/helper/error/failure.dart';
import '../../domain/entitie/search_entity.dart';
import '../models/category_menu_respons_model.dart';
import '../models/filter_category_response_model.dart';
import '../models/item_details_response_model.dart';
import '../service/menu_api_service.dart';

class MenuRepo {
  final MenuApiService menuApiService;

  MenuRepo({required this.menuApiService});

  Future<ApiResult<CategoryMenuResponsModel>> getCategoryList() async {
    try {
      final data = await menuApiService.getCategoryList();
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(FailureServer(error.toString()));
    }
  }

  Future<ApiResult<FilterCategoryResponseModel>> getFilterCategory({
    required String categoryName,
  }) async {
    try {
      final data = await menuApiService.getAllCategory(categoryName);
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(FailureServer(error.toString()));
    }
  }

  Future<ApiResult<ItemDetailsResponseModel>> getItemDetails({
    required String itemId,
  }) async {
    try {
      final data = await menuApiService.getItemDetails(itemId);
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(FailureServer(error.toString()));
    }
  }

  Future<ApiResult<FilterCategoryResponseModel>> getItemByCountry({
    required String country,
  }) async {
    try {
      final data = await menuApiService.getItemByCountry(country);
      return ApiResult.success(data);
    } catch (error) {
      return ApiResult.failure(FailureServer(error.toString()));
    }
  }

  Future<ApiResult<FilterCategoryResponseModel>> searchForFirstLetter({
    required String firstLetter,
  }) async {
    try {
      final response = await menuApiService.searchForFirstLetter(firstLetter);
      // final meals = response.meals;
      // final entities =
      //     meals
      //         ?.map(
      //           (meal) => SearchEntity(
      //             name: meal.name,
      //             image: meal.image,
      //             area: meal.area,
      //           ),
      //         )
      //         .toList() ??
      //     [];
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(FailureServer(error.toString()));
    }
  }
}
