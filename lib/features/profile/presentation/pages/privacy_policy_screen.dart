import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Kebijakan Privasi',
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
            _buildSection(
              title: '3. Penggunaan Data',
              content: 'Kami menggunakan data Anda untuk:',
              bullets: [
                'Menyediakan dan mengelola layanan kami',
                'Mengirim notifikasi terkait pesanan Anda',
                'Meningkatkan kualitas layanan kami',
                'Mencegah penipuan dan penyalahgunaan',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: '4. Keamanan Data',
              content:
                  'Kami menerapkan langkah-langkah keamanan teknis dan organisasional yang sesuai untuk melindungi data pribadi Anda dari akses, perubahan, pengungkapan, atau penghancuran yang tidak sah.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: '5. Berbagi Data',
              content:
                  'Kami tidak menjual data pribadi Anda. Kami hanya membagikan data dengan pihak ketiga yang diperlukan untuk menyediakan layanan (seperti teknisi dan penyedia pembayaran) dan hanya untuk tujuan yang telah dijelaskan.',
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: '6. Hak Anda',
              content: 'Anda memiliki hak untuk:',
              bullets: [
                'Mengakses data pribadi Anda',
                'Memperbaiki data yang tidak akurat',
                'Menghapus data Anda',
                'Membatasi pemrosesan data Anda',
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              title: '7. Hubungi Kami',
              content:
                  'Jika Anda memiliki pertanyaan tentang Kebijakan Privasi ini, silakan hubungi kami di:',
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.email_outlined,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Email: privacy@acservice.com',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.phone_outlined,
                  color: AppColors.textSecondary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Telepon: 0812-3456-7890',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: AppColors.infoBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Dengan menggunakan layanan kami, Anda menyetujui Kebijakan Privasi ini.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.infoText,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    List<String>? bullets,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: TextStyle(
            color: Colors.grey.shade700,
            height: 1.5,
            fontSize: 14,
          ),
        ),
        if (bullets != null) ...[
          const SizedBox(height: 8),
          ...bullets.map(
            (bullet) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                  ),
                  Expanded(
                    child: Text(
                      bullet,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        height: 1.5,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
