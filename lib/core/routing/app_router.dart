import 'package:flutter/material.dart';
import 'package:mkanak/core/routing/routes.dart';
import 'package:mkanak/features/home/presentation/screens/home_screen.dart';
import 'package:mkanak/features/onboarding/presentation/screens/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
