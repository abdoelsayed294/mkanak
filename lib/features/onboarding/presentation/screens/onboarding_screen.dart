import 'package:flutter/material.dart';
import 'package:mkanak/core/theming/app_color.dart';
import 'package:mkanak/features/onboarding/presentation/screens/onboarding1_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
    });
  }

  void _onNext() async {
    if (currentIndex < 2) {}
  }

  void _onSkip() {
    // Navigate on Login Screen.
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                //current index == value we will do it later
              },
              //Need to Add PageController =>>> //controller:
              children: [
                Onboarding1Screen(
                  currentIndex: currentIndex,
                  onSkip: _onSkip,
                  onNext: _onNext,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
