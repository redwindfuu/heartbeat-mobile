import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:heart_beat/base/styles/app_color.dart';
import 'package:get/get.dart';
import 'package:heart_beat/screens/home/components/home_page.dart';
import 'package:heart_beat/screens/home/components/user_page.dart';
import 'package:heart_beat/screens/home/home_controller.dart';

import '../../base/widgets/text_dialog.dart';
import '../../data/model/login_response.dart';

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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await Get.dialog<bool>(TextDialog(
            title: 'Thoát ứng dụng',
            content: 'Bạn có chắc muốn thoát ứng dụng?',
            textOkButton: 'Thoát',
            cancelFunc: () => Get.back(result: false),
            okFunc: () => Get.back(result: true)));
        return result ?? false;
      },
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: AppColor.primaryColor,
          items: const [
            Icon(Icons.home, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            controller.tabIndex.value = index;
          },
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Obx(() {
                if (controller.tabIndex.value == 0) {
                  return HomePage(
                    user: user,
                  );
                }
                return UserPage(
                  user: user,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
