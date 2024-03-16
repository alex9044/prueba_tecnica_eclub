import 'package:eclub/app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static final cardTextMedium = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static final cardTextLarge = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static const titleSmall = TextStyle(
    fontSize: 14,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
  static const titleMedium = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
  static final titleLarge = TextStyle(
    fontSize: 25,
    color: AppColors.deepPink,
    fontWeight: FontWeight.w500,
  );
  static const labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const labelMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const labelLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
}
