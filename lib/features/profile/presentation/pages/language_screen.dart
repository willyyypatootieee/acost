import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pilih Bahasa',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: Container(
        margin: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLanguageTile(
              flag: '🇮🇩',
              name: 'Bahasa Indonesia',
              isSelected: true,
            ),
            _buildDivider(),
            _buildLanguageTile(
              flag: '🇬🇧',
              name: 'English',
              isSelected: false,
            ),
            _buildDivider(),
            _buildLanguageTile(
              flag: '🇸🇦',
              name: 'العربية',
              isSelected: false,
            ),
            _buildDivider(),
            _buildLanguageTile(flag: '🇨🇳', name: '中文', isSelected: false),
            _buildDivider(),
            _buildLanguageTile(
              flag: '🇪🇸',
              name: 'Español',
              isSelected: false,
            ),
            _buildDivider(),
            _buildLanguageTile(
              flag: '🇫🇷',
              name: 'Français',
              isSelected: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile({
    required String flag,
    required String name,
    required bool isSelected,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Text(flag, style: const TextStyle(fontSize: 24)),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: AppColors.textPrimary,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check, color: AppColors.primary)
          : null,
      onTap: () {},
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 1, indent: 64, endIndent: 20);
  }
}
