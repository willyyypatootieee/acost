// lib/features/onboarding/presentation/onboarding_screen.dart
import 'package:acost/app/app_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  final _pages = const [
    _OnboardData(
      Icons.storefront_outlined,
      'Welcome',
      'Discover products fast.',
    ),
    _OnboardData(
      Icons.local_shipping_outlined,
      'Delivery',
      'Track orders in real-time.',
    ),
    _OnboardData(
      Icons.verified_user_outlined,
      'Secure',
      'Safe payments and account protection.',
    ),
  ];

  Future<void> _finish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seen_onboarding', true);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, AppRoutes.auth);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final last = _index == _pages.length - 1;
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: _finish, child: const Text('Skip'))],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: (v) => setState(() => _index = v),
              itemBuilder: (_, i) {
                final p = _pages[i];
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(p.icon, size: 96),
                      const SizedBox(height: 20),
                      Text(
                        p.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(p.subtitle, textAlign: TextAlign.center),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: FilledButton(
              onPressed: () async {
                if (last) {
                  await _finish();
                } else {
                  await _controller.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                  );
                }
              },
              child: Text(last ? 'Get Started' : 'Next'),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardData {
  final IconData icon;
  final String title;
  final String subtitle;
  const _OnboardData(this.icon, this.title, this.subtitle);
}
