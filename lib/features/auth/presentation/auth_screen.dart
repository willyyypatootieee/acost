import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'widgets/login_form.dart';
import 'widgets/register_form.dart';
import 'widgets/otp_form.dart';

enum AuthView { login, register, otp }

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  AuthView _currentView = AuthView.login;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_currentView != AuthView.otp && !_tabController.indexIsChanging) {
        setState(() {
          _currentView = _tabController.index == 0
              ? AuthView.login
              : AuthView.register;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _switchView(AuthView view) {
    setState(() {
      _currentView = view;
      if (view == AuthView.login) {
        _tabController.animateTo(0);
      } else if (view == AuthView.register) {
        _tabController.animateTo(1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isOtp = _currentView == AuthView.otp;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: isOtp ? 140 : 180,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 20),
                  // Logo Area
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/acostlogo(white).png',
                        height: 90,
                      ),
                    ),
                  ),

                  if (!isOtp)
                    TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.white,
                      indicatorWeight: 3,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white.withOpacity(0.7),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      tabs: const [
                        Tab(text: 'Masuk'),
                        Tab(text: 'Daftar'),
                      ],
                    ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  child: _buildCurrentView(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentView() {
    if (_currentView == AuthView.otp) {
      return OtpForm(onChangeNumber: () => _switchView(AuthView.register));
    }

    return TabBarView(
      controller: _tabController,
      children: [
        LoginForm(
          onLogin: () => _switchView(AuthView.otp),
          onGoToRegister: () => _switchView(AuthView.register),
        ),
        RegisterForm(onRegister: () => _switchView(AuthView.otp)),
      ],
    );
  }
}
