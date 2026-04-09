import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'pages/addresses_screen.dart';
import 'pages/edit_profile_screen.dart';
import 'pages/help_screen.dart';
import 'pages/language_screen.dart';
import 'pages/notifications_screen.dart';
import 'pages/payment_methods_screen.dart';
import 'pages/privacy_policy_screen.dart';
import 'widgets/profile_header.dart';
import 'widgets/section_title.dart';
import 'widgets/setting_tile.dart';
import 'widgets/settings_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileHeader(),
              const SizedBox(height: 16),
              const SectionTitle(title: 'Setting Cepat'),
              SettingsCard(
                children: [
                  SettingTile(
                    icon: Icons.dark_mode_outlined,
                    title: 'Mode Gelap',
                    subtitle: 'Tombol Mode Gelap',
                    trailing: Switch(
                      value: false,
                      onChanged: (val) {},
                      activeThumbColor: AppColors.primary,
                    ),
                  ),
                  const SettingDivider(),
                  SettingTile(
                    icon: Icons.language_outlined,
                    title: 'Bahasa',
                    subtitle: 'Bahasa Indonesia',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LanguageScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const SectionTitle(title: 'Preferensi'),
              SettingsCard(
                children: [
                  SettingTile(
                    icon: Icons.person_outline,
                    title: 'Personalisasi Akun',
                    subtitle: 'Ubah Akun',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfileScreen(),
                        ),
                      );
                    },
                  ),
                  const SettingDivider(),
                  SettingTile(
                    icon: Icons.location_on_outlined,
                    title: 'Alamat Saya',
                    subtitle: 'List Alamat Saya',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddressesScreen(),
                        ),
                      );
                    },
                  ),
                  const SettingDivider(),
                  SettingTile(
                    icon: Icons.payment_outlined,
                    title: 'Metode Pembayaran',
                    subtitle: 'Atur Kartu dan Metode Pembayaran',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentMethodsScreen(),
                        ),
                      );
                    },
                  ),
                  const SettingDivider(),
                  SettingTile(
                    icon: Icons.notifications_none,
                    title: 'Atur Notifikasi',
                    subtitle: 'Kelola preferensi notifikasi Anda',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      );
                    },
                  ),
                  const SettingDivider(),
                  SettingTile(
                    icon: Icons.help_outline,
                    title: 'Bantuan',
                    subtitle: 'Mau bantuan? Hubungi tim support',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HelpScreen(),
                        ),
                      );
                    },
                  ),
                  const SettingDivider(),
                  SettingTile(
                    icon: Icons.security_outlined,
                    title: 'Kebijakan Privasi',
                    subtitle: 'Read our privacy policy',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
