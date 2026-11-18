import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/core/widgets/custom_elevated_button.dart';
import 'package:mkanak/features/onboarding/presentation/widgets/custom_indicator.dart';
import 'package:mkanak/features/onboarding/presentation/widgets/custom_skip_button.dart';
import 'package:mkanak/features/onboarding/presentation/widgets/feature_highlight_pills.dart';
import 'package:mkanak/gen/assets.gen.dart';

class Onboarding1Screen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final int currentIndex;
  const Onboarding1Screen({
    super.key,
    required this.onNext,
    required this.onSkip,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: 290.h,
          child: Assets.images.onboardingImage1.image(width: 350.w),
        ),
        Positioned(
          top: 56.h,
          right: 16.w,
          child: CustomSkipButton(onPressed: onSkip),
        ),
        Positioned(
          top: 451.h,
          left: 0,
          right: 0,
          child: Text(
            'Your Neighborhood, All in One\nPlace',
            textAlign: TextAlign.center,
            style: TextStyles.font20BlackSemiBold(context),
          ),
        ),
        Positioned(
          top: 507.h,
          left: 0,
          right: 0,
          child: Text(
            'Discover everything around your home, from\nlocal stores and restaurants to everyday\nessential services.',
            textAlign: TextAlign.center,
            style: TextStyles.font14DarkGreenSemiBold(context),
          ),
        ),
        Positioned(
          top: 587.h,
          left: 16.w,
          right: 16.w,
          child: const FeatureHighlightPills(),
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
            text: 'Next',
            icon: Icons.arrow_forward,
            onPressed: onNext,
          ),
        ),
      ],
    );
  }
}
