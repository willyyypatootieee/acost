import 'package:flutter/material.dart';
import '../features/auth/presentation/auth_screen.dart';
import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/splash/presentation/splash_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const auth = '/auth';

  static Map<String, WidgetBuilder> get map => {
    splash: (_) => const SplashScreen(),
    onboarding: (_) => const OnboardingScreen(),
    auth: (_) => const AuthScreen(),
  };
}
