import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/core/theming/app_style.dart';

class CustomSkipButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomSkipButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(6.r),
        child: Container(
          width: 54.w,
          height: 36.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: AppColors.stroke),
          ),
          child: Text('Skip', style: TextStyles.font14DarkGreenMedium(context)),
        ),
      ),
    );
  }
}
