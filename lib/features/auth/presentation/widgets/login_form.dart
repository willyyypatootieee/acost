import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_button.dart';

import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onGoToRegister;

  const LoginForm({
    super.key,
    required this.onLogin,
    required this.onGoToRegister,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Masuk',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Masuk untuk melanjutkan layanan AC Anda',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 32),

          const AppTextField(
            hint: 'Nomor Telepon atau Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),

          const AppTextField(
            hint: 'Kata Sandi',
            obscureText: true,
            suffixIcon: Icon(
              Icons.visibility_off_outlined,
              color: AppColors.textSecondary,
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Lupa Kata Sandi?',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),
          AppButton(text: 'Masuk', onPressed: onLogin),

          const SizedBox(height: 24),
          Row(
            children: const [
              Expanded(child: Divider(color: AppColors.border, thickness: 1)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'atau',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(child: Divider(color: AppColors.border, thickness: 1)),
            ],
          ),
          const SizedBox(height: 24),

          AppButton(
            text: 'Masuk dengan Google',
            isSecondary: true,
            icon: SvgPicture.network(
              'https://upload.wikimedia.org/wikipedia/commons/c/c1/Google_%22G%22_logo.svg',
              height: 20,
              placeholderBuilder: (context) => const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            onPressed: () {},
          ),

          const SizedBox(height: 24),
          Center(
            child: GestureDetector(
              onTap: onGoToRegister,
              child: RichText(
                text: const TextSpan(
                  text: 'Belum punya akun? ',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: 'Daftar Sekarang',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),
          // Developer mode
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.developerModeBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.primaryLight.withOpacity(0.5),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.build_circle_outlined,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Developer Mode',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                AppButton(text: 'Skip Login →', onPressed: onLogin),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
