import 'package:flutter_mmv_with_getx/res/routes/routes_name.dart';
import 'package:flutter_mmv_with_getx/view/home/home_screen.dart';
import 'package:flutter_mmv_with_getx/view/login/login_screen.dart';
import 'package:flutter_mmv_with_getx/view/signup/signup_screen.dart';
import 'package:flutter_mmv_with_getx/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splash,
          page: () => SplashScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.login_screen,
          page: () => LoginScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 250),
        ),
        GetPage(
          name: RoutesName.home_screen,
          page: () => HomeScreen(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: Duration(milliseconds: 250),
        ),
      ];
}
