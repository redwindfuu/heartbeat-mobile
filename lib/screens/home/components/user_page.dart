import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_beat/app_route.dart';
import 'package:heart_beat/data/model/login_response.dart';
import 'package:heart_beat/screens/home/widgets/item_user_info.dart';
import 'package:heart_beat/utils/util_func.dart';
import 'package:intl/intl.dart';

import '../../../base/widgets/text_dialog.dart';
import '../../../data/local/preference/preference_manager_impl.dart';

class UserPage extends StatefulWidget {
  final LoginResponse user;
  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String formatDateTime(String dateTime) {
    return DateFormat('dd/MM/yyyy').format(DateTime.parse(dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ItemUserInfo(
                    label: 'Tên',
                    content: widget.user.name ?? '',
                  ),
                  ItemUserInfo(
                      label: 'Ngày sinh',
                      content: formatDateTime(widget.user.birth ?? '')),
                  ItemUserInfo(
                    label: 'Giới tính',
                    content: widget.user.gender == true ? 'Name' : 'Nữ',
                  ),
                  ItemUserInfo(
                    label: 'Có chơi thể thao',
                    content: widget.user.isPlaySport == true ? 'Có' : 'Không',
                  ),
                  ItemUserInfo(
                    label: 'Nơi ở',
                    content: widget.user.whereLive ?? '',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () async {
                Get.dialog(TextDialog(
                  title: 'Đăng xuất',
                  content: 'Bạn có chắc muốn đăng xuất?',
                  textOkButton: 'Đăng xuất',
                  cancelFunc: () => Get.back(),
                  okFunc: () async {
                    UtilFunc.instance.showLoading();
                    final result = await PreferenceManagerImpl.instance.clear();
                    UtilFunc.instance.hideLoading();
                    if (result) {
                      Get.offAllNamed(AppRoute.loginScreen);
                    } else {
                      Get.back();
                    }
                  },
                ));
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: const [
                    Icon(
                      Icons.logout,
                      size: 36,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Đăng xuất',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
