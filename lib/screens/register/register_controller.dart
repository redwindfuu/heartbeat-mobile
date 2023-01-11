import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterController extends GetxController{
  final error = ''.obs;
  String gender = '';
  String playSport = '';
  String liveArea = '';

  Future register({required String name,
  required String username,
  required String password,
  required String confirmPassword,
  required String birthday}) async{
    if(username.isEmpty ||
    password.isEmpty ||
    confirmPassword.isEmpty ||
    birthday.isEmpty || gender.isEmpty || playSport.isEmpty || liveArea.isEmpty){
      error.value = 'Bạn vui lòng điền đầy đủ thông tin';
    }else{
      if(password != confirmPassword){
        error.value = 'Mật khẩu không khớp';
      }else{
        await Future.delayed(const Duration(seconds: 3));
      }
    }
  }
}