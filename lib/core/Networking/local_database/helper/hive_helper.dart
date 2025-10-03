import 'package:hive_flutter/hive_flutter.dart';

import '../models/cached_user_model.dart';

class HiveHelper {
  static const userBoxName = 'usersBox';
  static const favoriteBoxName = 'favoriteBox';
  static const shoppingCartBoxName = 'shoppingCartBox';

  HiveHelper._();

  // فتح جميع الصناديق عند بدء التشغيل
  static Future<void> initHive() async {
    await Hive.initFlutter();

    // تسجيل Adapters
    // Hive.registerAdapter(CachedUserModelAdapter());
    // فتح الصناديق
    await Hive.openBox(userBoxName);
    await Hive.openBox(favoriteBoxName);
    await Hive.openBox(shoppingCartBoxName);
  }

  // **إدارة صندوق بيانات المستخدم**
  static Future<void> saveUserData(CachedUserModel userData) async {
    final box = Hive.box(userBoxName);
    await box.put(userBoxName, userData); // حفظ بيانات المستخدم بمفتاح ثابت
  }

  static CachedUserModel? getUserData() {
    final box = Hive.box(userBoxName);
    return box.get(userBoxName); // استرجاع بيانات المستخدم
  }

  static Future<void> deleteUserData() async {
    final box = Hive.box(userBoxName);
    await box.delete(userBoxName);
  }

  // static Future<void> addFavoriteProduct(FavoriteProductModel product) async {
  //   final box = Hive.box(favoriteBoxName);

  //   final exists = box.values.any((element) => element.id == product.id);

  //   if (!exists) {
  //     await box.add(product);
  //   } else {
  //     await removeFavoriteProduct(product);
  //   }
  // }

  // static List<FavoriteProductModel> getFavoriteProducts() {
  //   final box = Hive.box(favoriteBoxName);
  //   return box.values.toList().cast<FavoriteProductModel>();
  // }

  // static Future<void> removeFavoriteProduct(
  //   FavoriteProductModel product,
  // ) async {
  //   final box = Hive.box(favoriteBoxName);

  //   final key = box.keys.firstWhere(
  //     (k) => box.get(k)?.id == product.id,
  //     orElse: () => null,
  //   );

  //   if (key != null) {
  //     await box.delete(key);
  //   }
  // }

  // static Future<bool> isFavoriteProduct(FavoriteProductModel product) async {
  //   List<FavoriteProductModel> favModels = getFavoriteProducts();

  //   for (FavoriteProductModel i in favModels) {
  //     if (i.id == product.id) {
  //       return true;
  //     }
  //   }

  //   return false;
  // }

  static Future<void> removeAllFavoriteProducts() async {
    final box = Hive.box(favoriteBoxName);
    await box.clear();
  }

  // static Future<void> addProductToCart(ShoppingCartModel product) async {
  //   final box = Hive.box(shoppingCartBoxName);

  //   final exists = box.values.any((element) => element.id == product.id);

  //   if (!exists) {
  //     await box.add(product);
  //   } else {
  //     await removeProductFromCart(product);
  //   }
  // }

  // static List<ShoppingCartModel> getCartProducts() {
  //   final box = Hive.box(shoppingCartBoxName);
  //   return box.values.toList().cast<ShoppingCartModel>();
  // }

  // static Future<void> removeProductFromCart(ShoppingCartModel product) async {
  //   final box = Hive.box(shoppingCartBoxName);

  //   final key = box.keys.firstWhere(
  //     (k) => box.get(k)?.id == product.id,
  //     orElse: () => null,
  //   );

  //   if (key != null) {
  //     await box.delete(key);
  //   }
  // }

  // static Future<bool> isProductInCart(ShoppingCartModel product) async {
  //   List<ShoppingCartModel> cartModels = getCartProducts();

  //   for (ShoppingCartModel i in cartModels) {
  //     if (i.id == product.id) {
  //       return true;
  //     }
  //   }

  //   return false;
  // }

  static Future<void> removeAllCartProducts() async {
    final box = Hive.box(shoppingCartBoxName);
    await box.clear();
  }

  static Future<void> closeHive() async {
    await Hive.box(userBoxName).close();
    await Hive.box(favoriteBoxName).close();
  }
}
