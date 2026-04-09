import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Container(
                height: 230,
                width: double.infinity,
                color: Colors.white,
                alignment: Alignment.center,
                child: Image.asset(image, height: 150, fit: BoxFit.contain)
                    .animate()
                    .scale(
                      delay: 200.ms,
                      duration: 400.ms,
                      curve: Curves.easeOutBack,
                    ),
              ),
            )
            .animate()
            .fadeIn(duration: 500.ms)
            .slideY(begin: 0.1, duration: 500.ms, curve: Curves.easeOut),
        const SizedBox(height: 28),
        Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0E1013),
              ),
            )
            .animate()
            .fadeIn(delay: 300.ms, duration: 400.ms)
            .slideY(begin: 0.2, duration: 400.ms),
        const SizedBox(height: 12),
        Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 9, // using the previous 18/2
                color: Color(0xFF6E7076),
                height: 1.6,
              ),
            )
            .animate()
            .fadeIn(delay: 400.ms, duration: 400.ms)
            .slideY(begin: 0.2, duration: 400.ms),
      ],
    );
  }
}
