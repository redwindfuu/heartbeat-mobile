import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:heart_beat/app_route.dart';
import 'package:heart_beat/screens/splash/splash_screen.dart';

import 'base/styles/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoute.routes,
      theme: AppTheme.getBrightTheme(),
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
