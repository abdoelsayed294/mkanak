import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/theming/app_color.dart';

class CustomBackButton extends StatelessWidget {
  final double? radius;
  final Color? backGroundColor;
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  const CustomBackButton({
    super.key,
    this.radius,
    this.backGroundColor,
    this.width,
    this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 56.w,
      height: height ?? 48.h,
      decoration: BoxDecoration(
        color: backGroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: InkWell(
          onTap: onPressed,
          child: Icon(Icons.arrow_back, color: AppColors.black, size: 20.sp),
        ),
      ),
    );
  }
}
