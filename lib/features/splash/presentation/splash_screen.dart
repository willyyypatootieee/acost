import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app/app_route.dart';

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
    await Future.delayed(const Duration(seconds: 2));
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
    return const Scaffold(
      body: Center(
        child: Text(
          'acost',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
