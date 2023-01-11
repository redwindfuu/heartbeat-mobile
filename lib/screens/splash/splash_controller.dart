import 'package:get/get.dart';
import 'package:heart_beat/data/model/login_response.dart';

import '../../data/repository/repository_impl.dart';

class SplashController extends GetxController{

  final repo = RepositoryImpl();

  Future<LoginResponse?> login(String username, String password) async{
    final req = {
      "username": username,
      "password": password
    };
    final res = await repo.login(req);
    if(res.status == true && res.data != null){
      return res.data;
    }else{
      Get.snackbar('Error', res.message ?? '');
      return null;
    }
  }
}