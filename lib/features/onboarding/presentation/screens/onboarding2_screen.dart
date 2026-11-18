import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkanak/core/helpers/spacing.dart';
import 'package:mkanak/core/theming/app_style.dart';
import 'package:mkanak/core/widgets/custom_elevated_button.dart';
import 'package:mkanak/features/onboarding/presentation/widgets/custom_back_button.dart';
import 'package:mkanak/features/onboarding/presentation/widgets/custom_indicator.dart';
import 'package:mkanak/features/onboarding/presentation/widgets/custom_skip_button.dart';
import 'package:mkanak/gen/assets.gen.dart';

class Onboarding2Screen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onSkip;
  final int currentIndex;
  final VoidCallback onBack;
  const Onboarding2Screen({
    super.key,
    required this.onNext,
    required this.onSkip,
    required this.currentIndex,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          bottom: 210.h,
          child: Assets.images.onboardingImage2.image(width: 350.w),
        ),
        Positioned(
          top: 56.h,
          right: 16.w,
          child: CustomSkipButton(onPressed: onSkip),
        ),
        Positioned(
          top: 515.h,
          left: 0,
          right: 0,
          child: Text(
            'Everything You Need is Closer\nThan You Think',
            textAlign: TextAlign.center,
            style: TextStyles.font20BlackSemiBold(context),
          ),
        ),
        Positioned(
          top: 575.h,
          left: 0,
          right: 0,
          child: Text(
            'Explore nearby businesses, discover local\nservices, and find exactly what you need in\njust a few taps.',
            textAlign: TextAlign.center,
            style: TextStyles.font14DarkGreenSemiBold(context),
          ),
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
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomBackButton(onPressed: onBack),
              horizontalSpace(8),
              CustomElevatedButton(
                width: 272.w,
                text: 'Next',
                icon: Icons.arrow_forward,
                onPressed: onNext,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
