import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:heart_beat/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   Future.delayed(const Duration(seconds: 5), () => Get.toNamed(AppRoute.loginScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [Color(0xFF35DE64), Color(0xFF22BB84)],
        ),
      ),
      alignment: Alignment.center,
      child: const Center(
        child: SpinKitCircle(color: Colors.white, size: 60.0),
      ),
    );
  }
}
