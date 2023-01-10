import 'package:flutter/material.dart';
import 'package:heart_beat/base/styles/app_color.dart';
import 'package:heart_beat/base/widgets/app_button.dart';

import '../../base/styles/app_text_style.dart';
import '../../base/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text('Đăng nhập', style: AppTextStyle.bigTitle),
                const SizedBox(height: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      onTap: () => {},
                      isFocused: false,
                      hintText: 'Số điện thoại',
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 25),
                    CustomTextField(
                      hintText: 'Mật khẩu',
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),
                    AppButton(
                      onPressed: () async {
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
                       Text('Đăng ký', style: AppTextStyle.normalGrey.copyWith(color: AppColor.primaryColor),)
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
