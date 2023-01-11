import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class UtilFunc{
  static final instance = UtilFunc._();
  UtilFunc._();

  void showLoading(){
    Get.dialog(
      WillPopScope(child: const Center(
        child: SpinKitCircle(color: Colors.white, size: 60.0),
      ), onWillPop: () async{
        return false;
      }),
      barrierDismissible: false
    );
  }
  void hideLoading(){
    Get.back();
  }
}