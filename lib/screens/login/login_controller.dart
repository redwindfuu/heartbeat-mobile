import 'package:get/get.dart';
import 'package:heart_beat/data/model/login_response.dart';

import '../../app_route.dart';
import '../../data/local/preference/preference_manager.dart';
import '../../data/local/preference/preference_manager_impl.dart';
import '../../data/repository/repository_impl.dart';

class LoginController extends GetxController{

  final error = ''.obs;
  final repo = RepositoryImpl();
  LoginResponse? loginResponse;

  Future<bool> login({required String username, required String password}) async{
    if(username.isEmpty || password.isEmpty){
      error.value = 'Bạn vui lòng điền đầy đủ thông tin';
      return false;
    }else{
      final req = {
        "username": username,
        "password": password
      };
      final res = await repo.login(req);
      if(res.status == true && res.data != null){
        loginResponse = res.data;
        PreferenceManagerImpl.instance.setString(PreferenceManager.username, loginResponse?.username ?? '');
        PreferenceManagerImpl.instance.setString(PreferenceManager.password, loginResponse?.password ?? '');
        PreferenceManagerImpl.instance.setString(PreferenceManager.name, loginResponse?.name ?? '');
        return true;
      }else{
        error.value = res.message ?? 'error';
        return false;
      }
    }
  }
}