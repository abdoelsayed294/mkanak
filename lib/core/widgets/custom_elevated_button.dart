import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/helpers/spacing.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/core/theming/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textStyle,
    this.icon,
    this.width,
  });
  final String text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              text,
              maxLines: 1,
              style: textStyle ?? TextStyles.font16WhiteSemiBold(context),
            ),
            horizontalSpace(6),
            if (icon != null) Icon(icon, color: AppColors.white, size: 18.sp),
          ],
        ),
      ),
    );
  }
}
