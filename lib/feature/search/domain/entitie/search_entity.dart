import 'package:json_annotation/json_annotation.dart';

part 'search_entity.g.dart';

@JsonSerializable()
class SearchEntity {
  @JsonKey(name: 'strMeal')
  final String name;

  @JsonKey(name: 'strMealThumb')
  final String image;

  @JsonKey(name: 'strArea')
  final String area;

  SearchEntity({
    required this.name,
    required this.image,
    required this.area,
  });

  factory SearchEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchEntityToJson(this);
}
