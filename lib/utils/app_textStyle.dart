import 'package:flutter/material.dart';

import 'app_color.dart';

abstract final class AppTextStyle {
  static const TextStyle white36Bold = TextStyle(
    color: AppColor.white,
    fontSize: 36,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle white40Bold = TextStyle(
    color: AppColor.white,
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle black32SemiBold = TextStyle(
    color: AppColor.black,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle white24Medium = TextStyle(
    color: AppColor.white,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
}
