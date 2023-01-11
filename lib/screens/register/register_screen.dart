import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:heart_beat/app_route.dart';
import 'package:heart_beat/screens/register/register_controller.dart';
import 'package:heart_beat/screens/register/widgets/item_info.dart';
import 'package:heart_beat/utils/util_func.dart';
import 'package:intl/intl.dart';

import '../../base/styles/app_color.dart';
import '../../base/styles/app_image.dart';
import '../../base/styles/app_text_style.dart';
import '../../base/widgets/app_button.dart';
import '../../base/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = Get.put(RegisterController());

  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final birthdayController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    usernameController.dispose();
    passwordNameController.dispose();
    confirmPasswordController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text('Đăng ký', style: AppTextStyle.bigTitle),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: fullNameController,
                      isFocused: false,
                      prefix: const Icon(Icons.person),
                      hintText: 'Họ và tên',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: usernameController,
                      isFocused: false,
                      prefix: const Icon(Icons.person_outline_outlined),
                      hintText: 'Tên đăng nhập',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: passwordNameController,
                      hintText: 'Mật khẩu',
                      prefix: const Icon(Icons.lock),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: confirmPasswordController,
                      hintText: 'Nhập lại mật khẩu',
                      prefix: const Icon(Icons.lock),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialEntryMode: DatePickerEntryMode.input,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          fieldLabelText: 'Birthday',
                          fieldHintText: 'Month/Date/Year',
                        ).then((value) {
                          if (value != null) {
                            birthdayController.text =
                                DateFormat('yyyy/MM/dd').format(value);
                          }
                        });
                      },
                      controller: birthdayController,
                      isReadOnly: true,
                      hintText: 'Chọn ngày sinh',
                      prefix: const Icon(Icons.calendar_month),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ItemInfo(
                        label: 'Giới tính',
                        listData: const ['Male', 'Female'],
                        valueChanged: (e) {
                          controller.gender = e;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    ItemInfo(
                        label: 'Bạn chơi thể thao không?',
                        listData: const ['Có', 'Không'],
                        valueChanged: (e) {
                          controller.playSport = e;
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    ItemInfo(
                        label: 'Nơi ở',
                        listData: const ['Delta', 'Plateau', 'Highland'],
                        valueChanged: (e) {
                          controller.liveArea = e;
                        }),
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
                    const SizedBox(height: 24),
                    AppButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        UtilFunc.instance.showLoading();
                        final result = await controller.register(
                            name: fullNameController.text,
                            username: usernameController.text,
                            password: passwordNameController.text,
                            confirmPassword: confirmPasswordController.text,
                            birthday: birthdayController.text);
                        UtilFunc.instance.hideLoading();
                        if (result == true) {
                          Get.dialog(
                              WillPopScope(
                                onWillPop: () async {
                                  return false;
                                },
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0),
                                      child: Container(
                                        padding: const EdgeInsets.all(24),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              AppImage.success,
                                              height: 150,
                                              width: 150,
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            const Text(
                                              'Đăng ký thành công',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                            AppButton(
                                                text: 'OK',
                                                onPressed: () =>
                                                    Get.offAllNamed(
                                                        AppRoute.loginScreen))
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                              barrierDismissible: true);
                        }
                      },
                      text: 'Đăng ký',
                    ),
                    const SizedBox(height: 24),
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
