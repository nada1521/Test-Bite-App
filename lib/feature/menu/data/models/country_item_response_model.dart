class CountryItemResponseModel {
  final List<Meal> meals;

  CountryItemResponseModel({required this.meals});

  factory CountryItemResponseModel.fromJson(Map<String, dynamic> json) {
    return CountryItemResponseModel(
      meals: (json['meals'] as List<dynamic>)
          .map((meal) => Meal.fromJson(meal))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meals': meals.map((meal) => meal.toJson()).toList(),
    };
  }
}

class Meal {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      strMeal: json['strMeal'] ?? '',
      strMealThumb: json['strMealThumb'] ?? '',
      idMeal: json['idMeal'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strMeal': strMeal,
      'strMealThumb': strMealThumb,
      'idMeal': idMeal,
    };
  }
}
