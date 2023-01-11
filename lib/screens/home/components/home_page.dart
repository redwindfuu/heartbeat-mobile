import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/login_response.dart';
import '../widgets/header_home_page.dart';

class HomePage extends StatefulWidget {
  final LoginResponse user;
  const HomePage({Key? key,
  required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: Colors.white
      ),
      child: HeaderHomePage(user: widget.user,),
    );
  }
}
