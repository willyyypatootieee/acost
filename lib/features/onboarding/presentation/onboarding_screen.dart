import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app/app_route.dart';
import '../../../../core/widgets/app_button.dart';
import 'widgets/onboarding_content.dart';

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
      'assets/images/onboarding/onboarding1.png',
      'Layanan AC Profesional',
      'Teknisi berpengalaman siap melayani perawatan dan perbaikan AC Anda dengan standar kualitas terbaik',
    ),
    _OnboardData(
      'assets/images/onboarding/onboarding2.png',
      'Booking Mudah & Cepat',
      'Jadwalkan layanan AC kapan saja dengan mudah melalui aplikasi. Pilih waktu yang sesuai dengan kebutuhan Anda',
    ),
    _OnboardData(
      'assets/images/onboarding/onboarding3.png',
      'Kepuasan Terjamin',
      'Garansi layanan dan kepuasan pelanggan adalah prioritas kami. Dapatkan pengalaman terbaik dengan rating tinggi',
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
      backgroundColor: const Color(0xFFEFF1F4),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 10, color: const Color(0xFFD9EDF8)),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (v) => setState(() => _index = v),
                itemBuilder: (_, i) {
                  final p = _pages[i];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                    child: Column(
                      children: [
                        Expanded(
                          child: OnboardingContent(
                            image: p.image,
                            title: p.title,
                            subtitle: p.subtitle,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _pages.length,
                            (dotIndex) => AnimatedContainer(
                              duration: const Duration(milliseconds: 220),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: _index == dotIndex ? 24 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: _index == dotIndex
                                    ? const Color(0xFF2AA7E0)
                                    : const Color(0xFFD2D6DC),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            if (_index > 0)
                              Container(
                                width: 52,
                                height: 52,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFD7DDE3),
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    _controller.previousPage(
                                      duration: const Duration(
                                        milliseconds: 250,
                                      ),
                                      curve: Curves.easeOut,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                  ),
                                ),
                              ),
                            Expanded(
                              child: AppButton(
                                text: last ? 'Mulai Sekarang' : 'Lanjut',
                                onPressed: () async {
                                  if (last) {
                                    await _finish();
                                  } else {
                                    await _controller.nextPage(
                                      duration: const Duration(
                                        milliseconds: 250,
                                      ),
                                      curve: Curves.easeOut,
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: _finish,
                          child: const Text(
                            'Lewati',
                            style: TextStyle(color: Color(0xFF6E7076)),
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardData {
  final String image;
  final String title;
  final String subtitle;

  const _OnboardData(this.image, this.title, this.subtitle);
}
