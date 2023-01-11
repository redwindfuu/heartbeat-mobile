import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:heart_beat/base/styles/app_color.dart';
import 'package:get/get.dart';
import 'package:heart_beat/screens/home/components/home_page.dart';
import 'package:heart_beat/screens/home/components/user_page.dart';
import 'package:heart_beat/screens/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Obx((){
        if(controller.tabIndex.value == 0){
          return const HomePage();
        }
        return const UserPage();
      }),
    );
  }
}
