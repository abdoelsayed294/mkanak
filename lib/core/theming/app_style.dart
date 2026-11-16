import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/core/theming/font_weight_helper.dart';

/// Figma font: Poppins (set globally in the app theme).
class TextStyles {
  static TextStyle font16WhiteSemiBold(BuildContext context) => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.white,
  );
}
