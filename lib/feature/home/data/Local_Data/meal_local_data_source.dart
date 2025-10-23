import 'package:hive/hive.dart';
import '../models/local_model/meal_local_data_source.dart';

abstract class MealLocalDataSource {
  Future<void> cacheMeals(List<MealModel> meals);
  Future<List<MealModel>> getCachedMeals();
}

class MealLocalDataSourceImpl implements MealLocalDataSource {
  final Box box;

  MealLocalDataSourceImpl(this.box);

  @override
  Future<void> cacheMeals(List<MealModel> meals) async {
    await box.put('meals', meals.map((e) => e.toJson()).toList());
  }

  @override
  Future<List<MealModel>> getCachedMeals() async {
    final cachedData = box.get('meals');
    if (cachedData == null) return [];
    return (cachedData as List)
        .map((json) => MealModel.fromJson(Map<String, dynamic>.from(json)))
        .toList();
  }
}
