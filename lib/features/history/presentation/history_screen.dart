import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'pages/order_detail_screen.dart';
import 'widgets/order_history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  final List<Map<String, dynamic>> _dummyOrders = const [
    {
      'title': 'AC Cleaning Service',
      'address': 'Jl. Sudirman No. 45, Jakarta Selatan',
      'date': 'March 26, 2026',
      'isActive': true,
      'icon': Icons.air_outlined,
      'iconColor': Color(0xFF00A2E8),
    },
    {
      'title': 'AC Repair - Not Cooling',
      'address': 'Apartment Green Valley, Unit 12B',
      'date': 'March 20, 2026',
      'isActive': false,
      'icon': Icons.build_outlined,
      'iconColor': Color(0xFFF9A825),
    },
    {
      'title': 'AC Installation - Split 1.5 PK',
      'address': 'Jl. Gatot Subroto No. 88',
      'date': 'March 15, 2026',
      'isActive': false,
      'icon': Icons.all_inbox_outlined, // Box icon replacement
      'iconColor': Color(0xFF00895A),
    },
    {
      'title': 'AC Inspection - Pre-Purchase',
      'address': 'Villa Melati Mas Blok C5',
      'date': 'March 10, 2026',
      'isActive': false,
      'icon': Icons.assignment_outlined,
      'iconColor': Color(0xFF9C27B0), // Purple
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 16,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
            size: 24,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'Riwayat Order',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 24,
        ),
        itemCount: _dummyOrders.length,
        itemBuilder: (context, index) {
          final order = _dummyOrders[index];
          return OrderHistoryCard(
            title: order['title'],
            address: order['address'],
            date: order['date'],
            isActive: order['isActive'],
            serviceIcon: order['icon'],
            iconColor: order['iconColor'],
            onDetailPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderDetailScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
