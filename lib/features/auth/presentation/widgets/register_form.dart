import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/app_button.dart';

import 'package:flutter_svg/flutter_svg.dart';

class RegisterForm extends StatelessWidget {
  final VoidCallback onRegister;

  const RegisterForm({super.key, required this.onRegister});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Daftar',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Buat akun baru untuk menggunakan layanan kami',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
          const SizedBox(height: 32),

          const AppTextField(hint: 'Nama Lengkap'),
          const SizedBox(height: 16),

          Row(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.inputBackground,
                ),
                child: const Text(
                  '+62',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: AppTextField(
                  hint: 'Nomor Telepon',
                  keyboardType: TextInputType.phone,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          const AppTextField(
            hint: 'Email',
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
          const SizedBox(height: 24),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: false,
                  onChanged: (v) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: const BorderSide(color: AppColors.textSecondary),
                  activeColor: AppColors.textSecondary, // Using grey like image
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'Saya setuju dengan ',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      height: 1.4,
                    ),
                    children: [
                      TextSpan(
                        text: 'Syarat dan Ketentuan',
                        style: TextStyle(color: AppColors.primary),
                      ),
                      TextSpan(text: ' serta\n'),
                      TextSpan(
                        text: 'Kebijakan Privasi',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          AppButton(text: 'Daftar', onPressed: onRegister),

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
            text: 'Daftar dengan Google',
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
        ],
      ),
    );
  }
}
