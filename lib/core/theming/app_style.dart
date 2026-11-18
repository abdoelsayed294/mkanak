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
  static TextStyle font20BlackSemiBold(BuildContext context) => TextStyle(
    fontSize: 20.sp,
    height: 1,
    letterSpacing: 0,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.black,
  );
  static TextStyle font14DarkGreenSemiBold(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    height: 1.5,
    letterSpacing: 0,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.darkGreen,
  );
  static TextStyle font12BlackRegular(BuildContext context) => TextStyle(
    fontSize: 12.sp,
    height: 1,
    letterSpacing: 0,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.black,
  );
  static TextStyle font11BlackRegular(BuildContext context) => TextStyle(
    fontSize: 11.sp,
    height: 1.3,
    letterSpacing: 0,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.black,
  );
  static TextStyle font14DarkGreenMedium(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    height: 1.5,
    letterSpacing: 0,
    fontWeight: FontWeightHelper.medium,
    color: AppColors.darkGreen,
  );
}
