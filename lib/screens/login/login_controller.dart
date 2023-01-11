import 'package:get/get.dart';

import '../../app_route.dart';

class LoginController extends GetxController{

  final error = ''.obs;

  Future login({required String username, required String password}) async{
    if(username.isEmpty || password.isEmpty){
      error.value = 'Bạn vui lòng điền đầy đủ thông tin';
    }else{
      await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(AppRoute.homeScreen);
    }
  }
}