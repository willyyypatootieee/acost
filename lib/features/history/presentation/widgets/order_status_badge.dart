import 'package:flutter/material.dart';

class OrderStatusBadge extends StatelessWidget {
  final bool isActive;

  const OrderStatusBadge({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF9C4), // Light yellow
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.access_time_filled,
              size: 14,
              color: Color(0xFFF9A825),
            ),
            const SizedBox(width: 4),
            const Text(
              'Aktif',
              style: TextStyle(
                color: Color(0xFFF9A825), // Dark yellow
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8ED), // Light green
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline,
            size: 14,
            color: Color(0xFF00895A),
          ),
          const SizedBox(width: 4),
          const Text(
            'Selesai',
            style: TextStyle(
              color: Color(0xFF00895A),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
