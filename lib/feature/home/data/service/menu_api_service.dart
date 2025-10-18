import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/Networking/api_constans.dart';
import '../models/category_menu_respons_model.dart';
import '../models/filter_category_response_model.dart';
import '../models/item_details_response_model.dart';
part 'menu_api_service.g.dart';

@RestApi(baseUrl: ApiConstans.baseUrl)
abstract class MenuApiService {
  factory MenuApiService(Dio dio) = _MenuApiService;

  @GET(ApiConstans.allCategories)
  Future<CategoryMenuResponsModel> getCategoryList();

  @GET(ApiConstans.filterByCategory)
  Future<FilterCategoryResponseModel> getAllCategory(
    @Query("c") String categoryName,
  );

  @GET(ApiConstans.itemDetails)
  Future<ItemDetailsResponseModel> getItemDetails(@Query("i") String itemId);

  @GET(ApiConstans.filterByCountry)
  Future<FilterCategoryResponseModel> getItemByCountry(
    @Query("a") String country,
  );

  @GET(ApiConstans.searchAlpha)
  Future<FilterCategoryResponseModel> searchForFirstLetter(
    @Query("s") String firstLetter,
  );
}
