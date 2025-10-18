// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_menu_respons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryMenuResponsModel _$CategoryMenuResponsModelFromJson(
        Map<String, dynamic> json) =>
    CategoryMenuResponsModel(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryMenuResponsModelToJson(
        CategoryMenuResponsModel instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      idCategory: json['idCategory'] as String,
      categoryName: json['strCategory'] as String? ?? '',
      categoryImage: json['strCategoryThumb'] as String? ?? '',
      strCategoryDescription: json['strCategoryDescription'] as String? ?? '',
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.categoryName,
      'strCategoryThumb': instance.categoryImage,
      'strCategoryDescription': instance.strCategoryDescription,
    };
