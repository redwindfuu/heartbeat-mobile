import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_beat/screens/home/components/home_page.dart';
import 'package:heart_beat/screens/home/components/user_page.dart';
import 'package:heart_beat/screens/home/home_controller.dart';

import '../../base/widgets/text_dialog.dart';
import '../../data/model/login_response.dart';
import 'components/count_heart_beat_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());

  late LoginResponse user;

  @override
  void initState() {
    user = Get.arguments;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return WillPopScope(
      onWillPop: () async {
        final result = await Get.dialog<bool>(
          TextDialog(
            title: 'Thoát ứng dụng',
            content: 'Bạn có chắc muốn thoát ứng dụng?',
            textOkButton: 'Thoát',
            cancelFunc: () => Get.back(result: false),
            okFunc: () => Get.back(result: true),
          ),
        );
        return result ?? false;
      },
      child: Scaffold(
        bottomNavigationBar: Obx((() => BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bluetooth_audio),
                  label: 'Đo nhịp tim',
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Cá nhân',
                  backgroundColor: Colors.red,
                ),
              ],
              currentIndex: controller.tabIndex.value,
              onTap: (index) {
                controller.tabIndex.value = index;
                controller.getHeartBeat();
              },
            ))),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (controller.tabIndex.value == 0) {
                  return HomePage(user: user);
                }
                if (controller.tabIndex.value == 1) {
                  return CountHeartBeatPage();
                }
                return UserPage(user: user);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
