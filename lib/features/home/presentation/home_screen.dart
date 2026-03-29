import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';
import 'widgets/home_header.dart';
import 'widgets/service_status_card.dart';
import 'widgets/service_category_grid.dart';
import 'widgets/promo_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(userName: 'Wills')
                .animate()
                .fade(duration: 400.ms)
                .slideY(begin: -0.2, end: 0, duration: 400.ms),
            Transform.translate(
                  offset: const Offset(0, -30),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: ServiceStatusCard(),
                  ),
                )
                .animate()
                .fade(duration: 400.ms, delay: 200.ms)
                .slideY(begin: 0.2, end: 0, duration: 400.ms, delay: 200.ms),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ServiceCategoryGrid()
                  .animate()
                  .fade(duration: 400.ms, delay: 400.ms)
                  .slideX(begin: 0.1, end: 0, duration: 400.ms, delay: 400.ms),
            ),
            const SizedBox(height: 32),
            const PromoCards()
                .animate()
                .fade(duration: 400.ms, delay: 600.ms)
                .slideX(begin: 0.1, end: 0, duration: 400.ms, delay: 600.ms),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
