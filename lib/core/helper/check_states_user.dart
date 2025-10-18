import 'package:shared_preferences/shared_preferences.dart';

class CheckStatesUser {
  Future<bool> isLoagedIn() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    return shared.getBool("isLoagedIn")?? false;
  }

   Future<bool> login() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    return await shared.setBool("isLoagedIn",true);
  }
}



