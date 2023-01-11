import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:heart_beat/app_route.dart';

import '../../data/local/preference/preference_manager.dart';
import '../../data/local/preference/preference_manager_impl.dart';
import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final controller = Get.put(SplashController());

  void initData() async{
    final String username = await PreferenceManagerImpl.instance.getString(PreferenceManager.username);
    final String password = await PreferenceManagerImpl.instance.getString(PreferenceManager.password);

    if(username.isNotEmpty && password.isNotEmpty){
      final res = await controller.login(username, password);
      if(res != null){
        Get.offAndToNamed(AppRoute.homeScreen, arguments: res);
      }
    }else{
      Get.offAndToNamed(AppRoute.loginScreen);
    }
  }

  @override
  void initState() {
    initData();
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
