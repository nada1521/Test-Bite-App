// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterCategoryResponseModel _$FilterCategoryResponseModelFromJson(
        Map<String, dynamic> json) =>
    FilterCategoryResponseModel(
      meals: (json['meals'] as List<dynamic>?)
              ?.map((e) => ItemMenuModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$FilterCategoryResponseModelToJson(
        FilterCategoryResponseModel instance) =>
    <String, dynamic>{
      'meals': instance.meals,
    };

ItemMenuModel _$ItemMenuModelFromJson(Map<String, dynamic> json) =>
    ItemMenuModel(
      itemName: json['strMeal'] as String,
      itemImage: json['strMealThumb'] as String,
      itemId: json['idMeal'] as String,
    );

Map<String, dynamic> _$ItemMenuModelToJson(ItemMenuModel instance) =>
    <String, dynamic>{
      'strMeal': instance.itemName,
      'strMealThumb': instance.itemImage,
      'idMeal': instance.itemId,
    };
