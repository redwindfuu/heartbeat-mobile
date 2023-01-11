import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_beat/app_route.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white
      ),
      child: Center(
        child: GestureDetector(
          onTap: () => Get.offAllNamed(AppRoute.loginScreen),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              children: const [
                Icon(Icons.logout, size: 36,),
                SizedBox(width: 8,),
                Text('Đăng xuất', style: TextStyle(fontSize: 18),)
              ],
            ),
          ),
        ),
      )
    );
  }
}
