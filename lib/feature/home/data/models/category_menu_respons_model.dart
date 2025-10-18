import 'package:json_annotation/json_annotation.dart';
part 'category_menu_respons_model.g.dart';

@JsonSerializable()
class CategoryMenuResponsModel {
  final List<CategoryModel> categories;

  CategoryMenuResponsModel({required this.categories});

  factory CategoryMenuResponsModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryMenuResponsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryMenuResponsModelToJson(this);
}
@JsonSerializable()
class CategoryModel {
  final String idCategory;
  @JsonKey(name: "strCategory", defaultValue: "")
  final String categoryName;
  @JsonKey(name: "strCategoryThumb", defaultValue: "")
  final String categoryImage;
  @JsonKey(defaultValue: "")
  final String strCategoryDescription;

  CategoryModel({
    required this.idCategory,
    required this.categoryName,
    required this.categoryImage,
    required this.strCategoryDescription,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
