import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/helpers/spacing.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/core/theming/app_style.dart';

class CustomContainer extends StatelessWidget {
  final Widget icon;
  final String featureName;
  final String featureDescription;

  const CustomContainer({
    super.key,
    required this.icon,
    required this.featureName,
    required this.featureDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 94.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 12.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: Center(child: icon),
          ),
          verticalSpace(6),
          Text(
            featureName,
            textAlign: TextAlign.center,
            style: TextStyles.font12BlackRegular(context),
          ),
          verticalSpace(4),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              featureDescription,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyles.font11BlackRegular(context),
            ),
          ),
        ],
      ),
    );
  }
}
