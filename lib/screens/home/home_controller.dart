import 'package:get/get.dart';
import 'package:heart_beat/data/local/preference/preference_manager.dart';
import 'package:heart_beat/data/local/preference/preference_manager_impl.dart';
import 'package:heart_beat/data/model/get_heart_beat_response.dart';
import 'package:heart_beat/data/repository/repository_impl.dart';

class HomeController extends GetxController {
  final tabIndex = 0.obs;
  bool isLoading = false;

  final repo = RepositoryImpl();
  GetHeartBeatResponse? getHeartBeatResponse;

  @override
  void onReady() {
    getHeartBeat();
    super.onReady();
  }

  Future<void> getHeartBeat() async {
    isLoading = true;
    update();
    final userId = await PreferenceManagerImpl.instance.getString(PreferenceManager.userId);
    final req = {"userId": "63b1c19735e51b802c674ed0"};
    final res = await repo.getHeartBeat(req);
    if (res.status == true && res.data != null) {
      getHeartBeatResponse = res.data;
    }
    isLoading = false;
    update();
  }
}
