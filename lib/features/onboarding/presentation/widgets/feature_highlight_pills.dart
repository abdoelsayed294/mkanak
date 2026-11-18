import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/features/onboarding/presentation/widgets/custom_container.dart';
import 'package:mkanak/gen/assets.gen.dart';

class FeatureHighlightPills extends StatelessWidget {
  const FeatureHighlightPills({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomContainer(
              icon: SvgPicture.asset(
                Assets.svgs.delivery,
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              featureName: 'Fast Delivery',
              featureDescription: 'Under 20 min',
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: CustomContainer(
              icon: SvgPicture.asset(
                Assets.svgs.verified,
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.secoundry,
                  BlendMode.srcIn,
                ),
              ),
              featureName: 'Verified Merchants',
              featureDescription: 'Local Community',
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: CustomContainer(
              icon: SvgPicture.asset(
                Assets.svgs.cash,
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              featureName: 'Cash or Card',
              featureDescription: 'Pay on Delivery',
            ),
          ),
        ],
      ),
    );
  }
}
