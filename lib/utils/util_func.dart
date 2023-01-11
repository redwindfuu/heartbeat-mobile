import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class UtilFunc{
  static final instance = UtilFunc._();
  UtilFunc._();

  Future overlayFunc({required Future Function() asyncFunction}) async{
    await Get.showOverlay(
      loadingWidget: const SpinKitCircle(color: Colors.white, size: 60.0),
      asyncFunction: () => asyncFunction(), );
  }

}