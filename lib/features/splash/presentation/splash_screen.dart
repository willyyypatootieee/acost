import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../app/app_route.dart';
import '../../../core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await Future.delayed(const Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getBool('seen_onboarding') ?? false;
    if (!mounted) return;
    Navigator.pushReplacementNamed(
      context,
      seen ? AppRoutes.auth : AppRoutes.onboarding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset('assets/images/acostlogo(white).png', height: 120)
            .animate()
            .fadeIn(duration: 800.ms)
            .scale(
              begin: const Offset(0.8, 0.8),
              duration: 800.ms,
              curve: Curves.easeOutBack,
            )
            .shimmer(delay: 1.seconds, duration: 1.5.seconds),
      ),
    );
  }
}
