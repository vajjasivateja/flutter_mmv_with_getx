import 'dart:async';

import 'package:flutter_mmv_with_getx/data/shared_preferences/user_preferences.dart';
import 'package:flutter_mmv_with_getx/res/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashService {
  UserPreferences preferences = UserPreferences();

  void isLogin() {
    preferences.getUserData().then((value) {
      if (value.token != null && (value.token!.isNotEmpty || value.token!.toString() != "null")) {
        Timer(const Duration(seconds: 2), () => Get.offAllNamed(RoutesName.home_screen));
      } else {
        Timer(const Duration(seconds: 2), () => Get.offAllNamed(RoutesName.login_screen));
      }
    });
  }
}
