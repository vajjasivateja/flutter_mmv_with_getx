import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/UserDataModel.dart';

class UserPreferences {
  Future<bool> saveUser(UserDataModel userDataModel) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', userDataModel.token.toString());

    return true;
  }

  Future<UserDataModel> getUserData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('token');
    return UserDataModel(token: token);
  }

  Future<bool> remove() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }
}
