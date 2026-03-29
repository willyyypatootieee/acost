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
      Icons.handyman_outlined,
      'Layanan AC Profesional',
      'Teknisi berpengalaman siap melayani perawatan dan perbaikan AC Anda dengan standar kualitas terbaik',
    ),
    _OnboardData(
      Icons.assignment_turned_in_outlined,
      'Booking Mudah & Cepat',
      'Jadwalkan layanan AC kapan saja dengan mudah melalui aplikasi. Pilih waktu yang sesuai dengan kebutuhan Anda',
    ),
    _OnboardData(
      Icons.star_border_rounded,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: Container(
                                  height: 230,
                                  width: double.infinity,
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Icon(
                                    p.icon,
                                    size: 70,
                                    color: const Color(0xFF2AA7E0),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 28),
                              Text(
                                p.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 40 / 2,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0E1013),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                p.subtitle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 18 / 2,
                                  color: Color(0xFF6E7076),
                                  height: 1.6,
                                ),
                              ),
                            ],
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
                              child: SizedBox(
                                height: 52,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: const Color(0xFF2AA7E0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                  ),
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
                                  child: Text(
                                    last ? 'Mulai Sekarang' : 'Lanjut',
                                  ),
                                ),
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
  final IconData icon;
  final String title;
  final String subtitle;

  const _OnboardData(this.icon, this.title, this.subtitle);
}
