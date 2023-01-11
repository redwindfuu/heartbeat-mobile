import 'package:flutter/material.dart';
import 'package:heart_beat/app_route.dart';
import 'package:heart_beat/base/styles/app_color.dart';
import 'package:heart_beat/base/widgets/app_button.dart';
import 'package:get/get.dart';
import 'package:heart_beat/screens/login/login_controller.dart';
import 'package:heart_beat/utils/util_func.dart';

import '../../base/styles/app_text_style.dart';
import '../../base/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text('Đăng nhập', style: AppTextStyle.bigTitle),
                Obx(() {
                  if (controller.error.isNotEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        controller.error.value,
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),
                const SizedBox(height: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: usernameController,
                      isFocused: false,
                      prefix: const Icon(Icons.person),
                      hintText: 'Tên đăng nhập',
                    ),
                    const SizedBox(height: 25),
                    CustomTextField(
                      controller: passwordController,
                      hintText: 'Mật khẩu',
                      prefix: const Icon(Icons.lock),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),
                    AppButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        UtilFunc.instance.overlayFunc(
                            asyncFunction: () => controller.login(
                                username: usernameController.text,
                                password: passwordController.text));
                      },
                      text: 'Đăng nhập',
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Bạn chưa có tài khoản? ',
                          style: AppTextStyle.normalGrey,
                        ),
                        GestureDetector(
                            onTap: () => Get.toNamed(AppRoute.registerScreen),
                            child: Text(
                              'Đăng ký',
                              style: AppTextStyle.normalGrey.copyWith(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.w700),
                            ))
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
