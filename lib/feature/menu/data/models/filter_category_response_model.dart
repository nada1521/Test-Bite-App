import 'package:json_annotation/json_annotation.dart';

part 'filter_category_response_model.g.dart';

@JsonSerializable()
class FilterCategoryResponseModel {
  final List<ItemMenuModel> meals;

  FilterCategoryResponseModel({required this.meals});

  factory FilterCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FilterCategoryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterCategoryResponseModelToJson(this);
}

@JsonSerializable()
class ItemMenuModel {
  @JsonKey(name: "strMeal")
  final String itemName;
  @JsonKey(name: "strMealThumb")
  final String itemImage;
  @JsonKey(name: "idMeal")
  final String itemId;
  ItemMenuModel({
    required this.itemName,
    required this.itemImage,
    required this.itemId,
  });

  factory ItemMenuModel.fromJson(Map<String, dynamic> json) =>
      _$ItemMenuModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemMenuModelToJson(this);
}
