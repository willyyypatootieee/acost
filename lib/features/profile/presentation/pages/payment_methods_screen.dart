import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Metode Pembayaran',
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
              'E-Wallet',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildPaymentMethodTile(
                    icon: Icons.account_balance_wallet,
                    iconColor: Colors.green,
                    title: 'GoPay',
                    isConnected: true,
                  ),
                  _buildDivider(),
                  _buildPaymentMethodTile(
                    icon: Icons.account_balance_wallet,
                    iconColor: Colors.blue,
                    title: 'OVO',
                    isConnected: true,
                  ),
                  _buildDivider(),
                  _buildPaymentMethodTile(
                    icon: Icons.favorite,
                    iconColor: Colors.blueAccent,
                    title: 'Dana',
                    isConnected: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Kartu Kredit/Debit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildPaymentMethodTile(
                    icon: Icons.credit_card,
                    iconColor: Colors.amber,
                    title: 'Visa •••• 4242',
                    isConnected: true,
                  ),
                  _buildDivider(),
                  _buildPaymentMethodTile(
                    icon: Icons.credit_card,
                    iconColor: Colors.amber,
                    title: 'Mastercard •••• 5555',
                    isConnected: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              '+ Tambah Metode Pembayaran',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required bool isConnected,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      subtitle: Text(
        isConnected ? 'Terhubung' : 'Belum terhubung',
        style: TextStyle(
          color: isConnected ? Colors.green : Colors.grey.shade500,
          fontSize: 12,
        ),
      ),
      trailing: TextButton(
        onPressed: () {},
        child: Text(
          isConnected ? 'Hapus' : 'Hubungkan',
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, thickness: 1, indent: 64);
  }
}
