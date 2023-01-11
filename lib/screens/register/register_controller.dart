import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:heart_beat/data/repository/repository_impl.dart';

class RegisterController extends GetxController{
  final error = ''.obs;
  String gender = '';
  String playSport = '';
  String liveArea = '';

  final repo = RepositoryImpl();

  Future<bool> register({required String name,
  required String username,
  required String password,
  required String confirmPassword,
  required String birthday}) async{
    if(username.isEmpty ||
    password.isEmpty ||
    confirmPassword.isEmpty ||
    birthday.isEmpty || gender.isEmpty || playSport.isEmpty || liveArea.isEmpty){
      error.value = 'Bạn vui lòng điền đầy đủ thông tin';
      return false;
    }else{
      if(password != confirmPassword){
        error.value = 'Mật khẩu không khớp';
        return false;
      }else{
        final req = {
          "username": username,
          "password": password,
          "fullname": name,
          "birthday": birthday,
          "isPlaySport": playSport == 'Có' ? true : false,
          "gender": gender == 'Male' ? true : false,
          "whereLive": liveArea
        };

        final res = await repo.register(req);
        if(res.status == true){
          return true;
        }else{
          error.value = res.message ?? 'error';
          return false;
        }
      }
    }
  }
}