import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/features/onboarding/presentation/widgets/custom_container.dart';
import 'package:mkanak/gen/assets.gen.dart';

class ServiceFeaturePills extends StatelessWidget {
  const ServiceFeaturePills({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomContainer(
              backGroundColor: AppColors.mlGreen,
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
              featureDescription: '20 Min Drop',
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: CustomContainer(
              backGroundColor: AppColors.lightBroown,
              icon: SvgPicture.asset(
                Assets.svgs.homeService,
                width: 20.w,
                height: 20.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.brown,
                  BlendMode.srcIn,
                ),
              ),
              featureName: 'Trusted Pros',
              featureDescription: 'Home Services',
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: CustomContainer(
              backGroundColor: AppColors.mlGreen,
              icon: SvgPicture.asset(
                Assets.svgs.market,
                width: 20.w,
                height: 20.h,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              featureName: 'Fresh Grocers',
              featureDescription: 'Neighborhood\nBaqal',
            ),
          ),
        ],
      ),
    );
  }
}
