import 'package:flutter/material.dart';
import 'package:flutter_mmv_with_getx/res/colors/app_colors.dart';
import 'package:flutter_mmv_with_getx/viewModels/services/splash_service.dart';
import 'package:get/get.dart';
import '../res/components/general_exception_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService = SplashService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
            child: Text(
          "welcome_back".tr,
          style: TextStyle(color: AppColors.whiteColor, fontSize: 28),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
