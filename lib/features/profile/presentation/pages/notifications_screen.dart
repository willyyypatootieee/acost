import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text(
          'Atur Notifikasi',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saluran Notifikasi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildCard([
              _buildSwitchTile(
                icon: Icons.notifications_active_outlined,
                title: 'Notifikasi Push',
                subtitle: 'Terima notifikasi di aplikasi',
                value: true,
              ),
              _buildDivider(),
              _buildSwitchTile(
                icon: Icons.email_outlined,
                title: 'Notifikasi Email',
                subtitle: 'Terima notifikasi via email',
                value: true,
              ),
              _buildDivider(),
              _buildSwitchTile(
                icon: Icons.sms_outlined,
                title: 'Notifikasi SMS',
                subtitle: 'Terima notifikasi via SMS',
                value: false,
              ),
            ]),
            const SizedBox(height: 24),
            const Text(
              'Preferensi Konten',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            _buildCard([
              _buildSwitchTile(
                title: 'Update Pesanan',
                subtitle: 'Status dan perubahan pesanan',
                value: true,
              ),
              _buildDivider(),
              _buildSwitchTile(
                title: 'Promo & Penawaran',
                subtitle: 'Dapatkan info promo terbaru',
                value: true,
              ),
              _buildDivider(),
              _buildSwitchTile(
                title: 'Pesan Teknisi',
                subtitle: 'Notifikasi chat dari teknisi',
                value: true,
              ),
              _buildDivider(),
              _buildSwitchTile(
                title: 'Pengingat Pembayaran',
                subtitle: 'Pengingat untuk pembayaran',
                value: true,
              ),
              _buildDivider(),
              _buildSwitchTile(
                title: 'Review Layanan',
                subtitle: 'Permintaan untuk memberikan review',
                value: false,
              ),
            ]),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.infoBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Anda tetap akan menerima notifikasi penting terkait keamanan akun dan transaksi terlepas dari pengaturan ini.',
                      style: TextStyle(
                        color: AppColors.infoText,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile({
    IconData? icon,
    required String title,
    required String subtitle,
    required bool value,
  }) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: AppColors.primary) : null,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
      ),
      trailing: Switch(
        value: value,
        onChanged: (val) {},
        activeThumbColor: AppColors.primary,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16);
  }
}
