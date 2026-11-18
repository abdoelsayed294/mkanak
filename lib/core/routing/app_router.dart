import 'package:flutter/material.dart';
import 'package:mkanak/core/routing/routes.dart';
import 'package:mkanak/features/auth/presentation/screens/create_new_password_screen.dart';
import 'package:mkanak/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:mkanak/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:mkanak/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:mkanak/features/onboarding/presentation/screens/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case Routes.signInScreen:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(builder: (context) => const ForgetPasswordScreen());
      case Routes.createNewPasswordScreen:
        return MaterialPageRoute(builder: (context) => const CreateNewPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
