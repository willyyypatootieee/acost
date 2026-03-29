import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../services/presentation/service_detail_screen.dart';

class ServiceCategoryGrid extends StatelessWidget {
  ServiceCategoryGrid({super.key});

  final List<Map<String, dynamic>> services = [
    {
      'icon': Icons.layers_outlined,
      'label': 'AClean',
      'color': const Color(0xFFE8F8ED),
      'iconColor': const Color(0xFF00895A),
    },
    {
      'icon': Icons.air_outlined,
      'label': 'ACServis',
      'color': const Color(0xFFE6F0FF),
      'iconColor': const Color(0xFF007AFF),
    },
    {
      'icon': Icons.assignment_outlined,
      'label': 'ACPasang',
      'color': const Color(0xFFFFEDED),
      'iconColor': const Color(0xFFE53935),
    },
    {
      'icon': Icons.design_services_outlined,
      'label': 'ACCopot',
      'color': const Color(0xFFE8F8ED),
      'iconColor': const Color(0xFF00A2E8),
    },
    {
      'icon': Icons.shopping_cart_outlined,
      'label': 'ACInspect',
      'color': const Color(0xFFFFEDED),
      'iconColor': const Color(0xFFE53935),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: services.map((service) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    ServiceDetailScreen.open(context, service['label']);
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: service['color'],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          service['icon'],
                          color: service['iconColor'],
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        service['label'],
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
