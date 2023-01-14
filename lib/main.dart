import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:heart_beat/app_route.dart';
import 'package:heart_beat/screens/home/home_controller.dart';
import 'package:heart_beat/screens/splash/splash_screen.dart';

import 'base/styles/app_theme.dart';

void main() {
  runApp(MyApp());
}

class ControllerBindings extends Bindings {
  @override
  void dependencies() {}
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      getPages: AppRoute.routes,
      theme: AppTheme.getBrightTheme(),
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
