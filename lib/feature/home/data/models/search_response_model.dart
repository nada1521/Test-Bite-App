import 'package:json_annotation/json_annotation.dart';
import '../../../search/domain/entitie/search_entity.dart';
part 'search_response_model.g.dart';

@JsonSerializable()
class SearchResponseModel {
  final List<SearchEntity>? meals;

  SearchResponseModel({this.meals});

 factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
  final mealsData = json['meals'];
  if (mealsData is List) {
    return SearchResponseModel(
      meals: mealsData
          .map((e) => SearchEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  } else {
    return SearchResponseModel(meals: []);
  }
}

  Map<String, dynamic> toJson() => _$SearchResponseModelToJson(this);
}
