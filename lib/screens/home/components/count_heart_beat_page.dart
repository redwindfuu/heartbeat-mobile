import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/login_response.dart';
import '../home_controller.dart';

class CountHeartBeatPage extends StatefulWidget {
  final LoginResponse user;
  const CountHeartBeatPage({Key? key, required this.user}) : super(key: key);

  @override
  State<CountHeartBeatPage> createState() => _CountHeartBeatPageState();
}

class _CountHeartBeatPageState extends State<CountHeartBeatPage> {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Danh sách thiết bị tìm thấy")),
      body: Column(
        children: [],
      ),
    );
  }
}
