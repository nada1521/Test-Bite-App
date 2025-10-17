// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchEntity _$SearchEntityFromJson(Map<String, dynamic> json) => SearchEntity(
      name: json['strMeal'] as String,
      image: json['strMealThumb'] as String,
      area: json['strArea'] as String,
    );

Map<String, dynamic> _$SearchEntityToJson(SearchEntity instance) =>
    <String, dynamic>{
      'strMeal': instance.name,
      'strMealThumb': instance.image,
      'strArea': instance.area,
    };
