import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';

class OrderDetailInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isValueBold;
  final Color? valueColor;

  const OrderDetailInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.isValueBold = true,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isValueBold ? FontWeight.bold : FontWeight.normal,
            color: valueColor ?? AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
