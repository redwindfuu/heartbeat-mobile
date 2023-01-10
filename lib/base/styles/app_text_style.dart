import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTextStyle{
  static const TextStyle smallBlack = TextStyle(
    color: AppColor.blackText,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle normalGrey = TextStyle(
    color: AppColor.greyText,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bigTitle = TextStyle(
    color: AppColor.blackText,
    fontSize: 24,
    fontWeight: FontWeight.w800,
  );
}