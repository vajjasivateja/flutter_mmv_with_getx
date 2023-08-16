import 'package:flutter/material.dart';
import 'package:flutter_mmv_with_getx/res/localisation/languages.dart';
import 'package:flutter_mmv_with_getx/res/routes/routes.dart';
import 'package:get/get.dart';
import 'view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
      getPages: AppRoutes.appRoutes(),
      fallbackLocale: Locale("en","US"),
      locale: Locale("en", "US"),
      translations: Languages(),
    );
  }
}
