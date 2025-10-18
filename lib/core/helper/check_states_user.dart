import 'package:shared_preferences/shared_preferences.dart';

class CheckStatesUser {
  Future<bool> isLoggedIn() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getBool("isLoggedIn") ?? false;
  }

  Future<bool> login() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.setBool("isLoggedIn", true);
  }

  Future<bool> logOut() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.setBool("isLoggedIn", false);
  }
}
