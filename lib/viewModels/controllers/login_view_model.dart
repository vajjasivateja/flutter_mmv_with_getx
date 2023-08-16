import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mmv_with_getx/models/UserDataModel.dart';
import 'package:flutter_mmv_with_getx/repositories/login_repository.dart';
import 'package:flutter_mmv_with_getx/res/routes/routes_name.dart';
import 'package:flutter_mmv_with_getx/utils/utils.dart';
import 'package:get/get.dart';

import '../../data/shared_preferences/user_preferences.dart';

class LoginViewModel extends GetxController {
  UserPreferences preferences = UserPreferences();
  final _loginRepo = LoginRepository();
  RxBool loading = false.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      "email": emailController.value.text.toString().trim(),
      "password": passwordController.value.text.toString().trim(),
    };
    _loginRepo.loginApi(data).then((value) {
      loading.value = false;
      preferences.saveUser(UserDataModel.fromJson(value)).then((value) {
        Get.delete<LoginViewModel>();
        Get.offAllNamed(RoutesName.home_screen)!.then((value) {});
      }).onError((error, stackTrace) {});
      Utils.successSnackBar("Login", "Login Success");
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.errorSnackBar("Error", error.toString());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
