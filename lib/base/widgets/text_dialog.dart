import 'package:flutter/material.dart';

import '../styles/app_color.dart';
import 'app_button.dart';

class TextDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? textCancelButton;
  final String? textOkButton;
  final VoidCallback cancelFunc;
  final VoidCallback okFunc;
  const TextDialog(
      {Key? key,
      required this.title,
      required this.content,
      required this.cancelFunc,
      required this.okFunc,
      this.textCancelButton,
      this.textOkButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryColor),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  content,
                  style:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                          borderSide:
                              const BorderSide(color: AppColor.primaryColor),
                          buttonBgColor: Colors.white,
                          textStyle: const TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          text: textCancelButton ?? 'Quay lại',
                          onPressed: cancelFunc),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: AppButton(
                          text: textOkButton ?? 'Ok', onPressed: okFunc),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
