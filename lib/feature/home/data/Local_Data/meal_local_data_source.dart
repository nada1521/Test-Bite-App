// import 'package:hive/hive.dart';
// import 'package:tasty_bite/feature/home/data/models/category_menu_respons_model.dart';
// import 'package:tasty_bite/feature/home/data/models/filter_category_response_model.dart';

// abstract class MealLocalDataSource {
//   Future<void> cacheMeals(List<ItemMenuModel> meals);
//   Future<List<ItemMenuModel>> getCachedMeals();
//   // Future<void> cacheCategory(List<CategoryModel> category);
//   // Future<List<CategoryModel>> getCachedCategory();
// }

// class MealLocalDataSourceImpl implements MealLocalDataSource {
//   final Box box;

//   MealLocalDataSourceImpl(this.box);

//   @override
//   Future<void> cacheMeals(List<ItemMenuModel> meals) async {
//     await box.put('meals', meals.map((e) => e.toJson()).toList());
//   }

//   // Future<void> cacheCategory(List<CategoryModel> meals) async {
//   //   await box.put('categories', meals.map((e) => e.toJson()).toList());
//   // }

//   @override
//   Future<List<ItemMenuModel>> getCachedMeals() async {
//     final cachedData = box.get('meals');
//     if (cachedData == null) return [];
//     return (cachedData as List)
//         .map((json) => ItemMenuModel.fromJson(Map<String, dynamic>.from(json)))
//         .toList();
//   }

//   // Future<List<CategoryModel>> getCachedCategory() async {
//   //   final cachedData = box.get('categories');
//   //   if (cachedData == null) return [];
//   //   return (cachedData as List)
//   //       .map((json) => CategoryModel.fromJson(Map<String, dynamic>.from(json)))
//   //       .toList();
//   // }
// }
