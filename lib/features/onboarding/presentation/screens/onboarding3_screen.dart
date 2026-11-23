import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/core/widgets/custom_elevated_button.dart';
import 'package:mkanak/features/onboarding/presentation/widgets/custom_indicator.dart';
import 'package:mkanak/features/onboarding/presentation/widgets/service_feature_pills.dart';
import 'package:mkanak/gen/assets.gen.dart';

class Onboarding3Screen extends StatelessWidget {
  final int currentIndex;
  final VoidCallback onGetStarted;
  const Onboarding3Screen({
    super.key,
    required this.currentIndex,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: 355.h,
          child: Assets.images.onboardingImage3.image(width: 350.w),
        ),
        Positioned(
          top: 405.h,
          left: 0,
          right: 0,
          child: Text(
            'Get to Know Your Neighborhood',
            textAlign: TextAlign.center,
            style: TextStyles.font20BlackSemiBold(context),
          ),
        ),
        Positioned(
          top: 438.h,
          left: 0,
          right: 0,
          child: Text(
            'Whether you \'re new to the area or simply \nexploring, Makanak connects you with the local\nbusinesses and services that make your\nneighborhood feel like home.',
            textAlign: TextAlign.center,

            style: TextStyles.font14DarkGreenSemiBold(context)
                .copyWith(height: 1.4.h),
          ),
        ),
        Positioned(
          top: 535.h,
          left: 16.w,
          right: 16.w,
          child: const ServiceFeaturePills(),
        ),
        Positioned(
          top: 697.h,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIndicator(active: currentIndex == 0),
              SizedBox(width: 8.w),
              CustomIndicator(active: currentIndex == 1),
              SizedBox(width: 8.w),
              CustomIndicator(active: currentIndex == 2),
            ],
          ),
        ),
        Positioned(
          top: 721.h,
          left: 16.w,
          right: 16.w,
          child: CustomElevatedButton(
            text: 'Get Started',
            onPressed: onGetStarted,
          ),
        ),
      ],
    );
  }
}
