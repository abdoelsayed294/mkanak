import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/helpers/spacing.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/core/theming/app_style.dart';

class CustomElevatedButton extends StatelessWidget {
  /// Default filled button (unchanged).
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textStyle,
    this.icon,
    this.leading,
  }) : _outlined = false;

  /// White button with a stroke
  const CustomElevatedButton.outlined({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.icon,
    this.leading,
  }) : backgroundColor = AppColors.white,
       _outlined = true;

  /// "Sign in with platform"

  const CustomElevatedButton.platform({
    super.key,
    required this.text,
    required this.onPressed,
    required Widget logo,
    this.textStyle,
  }) : backgroundColor = AppColors.white,
       icon = null,
       leading = logo,
       _outlined = true;

  final String text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Widget? leading;
  final bool _outlined;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
            side: _outlined
                ? const BorderSide(color: AppColors.stroke)
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (leading != null) ...[leading!, horizontalSpace(8)],
            AutoSizeText(
              text,
              maxLines: 1,
              style:
                  textStyle ??
                  (_outlined
                      ? TextStyles.font16BlackSemiBold(context)
                      : TextStyles.font16WhiteSemiBold(context)),
            ),
            horizontalSpace(6),
            if (icon != null) Icon(icon, color: AppColors.white, size: 18.sp),
          ],
        ),
      ),
    );
  }
}
