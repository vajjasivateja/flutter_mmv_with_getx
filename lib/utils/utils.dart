import 'package:flutter_mmv_with_getx/res/colors/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static filedFocusChange(BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static errorToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static successToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static errorSnackBar(String title, String message) {
    Get.snackbar(title, message, backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM, colorText: AppColors.whiteColor);
  }

  static successSnackBar(String title, String message) {
    Get.snackbar(title, message, backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM, colorText: AppColors.whiteColor);
  }
}
