import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ServiceDetailScreen extends StatelessWidget {
  final Map<String, dynamic> serviceData;

  const ServiceDetailScreen({super.key, required this.serviceData});

  static Map<String, dynamic> _getServiceDetails(String title) {
    switch (title) {
      case 'ACService':
      case 'ACServis':
        return {
          'title': 'ACService',
          'price': 'Rp 150.000',
          'numericPrice': 'Rp 150.000',
          'desc':
              'Perawatan rutin untuk menjaga performa AC tetap optimal dan hemat energi',
          'duration': 'Durasi: 60-90 menit',
          'includes': [
            'Pengecekan tekanan freon',
            'Pembersihan filter udara',
            'Pengecekan sistem kelistrikan',
            'Pelumasan komponen mekanis',
            'Pengecekan suara dan getaran',
          ],
          'benefits': [
            'AC lebih dingin dan hemat listrik',
            'Udara lebih bersih dan sehat',
            'Mencegah kerusakan komponen',
          ],
        };
      case 'AClean':
      case 'ACCleaning':
        return {
          'title': 'ACCleaning',
          'price': 'Rp 200.000',
          'numericPrice': 'Rp 200.000',
          'desc':
              'Pembersihan menyeluruh untuk udara lebih segar dan kesehatan keluarga',
          'duration': 'Durasi: 90-120 menit',
          'includes': [
            'Pembersihan evaporator dengan chemical',
            'Pembersihan filter dan blower',
            'Pembersihan drain pan dan pipa',
            'Desinfeksi seluruh unit',
            'Pembersihan casing luar',
          ],
          'benefits': [
            'Menghilangkan bau tidak sedap',
            'Mengurangi bakteri dan jamur',
            'Aliran udara lebih maksimal',
          ],
        };
      case 'AC Pasang':
      case 'ACPasang':
        return {
          'title': 'AC Pasang',
          'price': 'Rp 350.000',
          'numericPrice': 'Rp 350.000',
          'desc':
              'Instalasi AC baru dengan standar profesional dan garansi pemasangan',
          'duration': 'Durasi: 120-180 menit',
          'includes': [
            'Pemasangan unit indoor & outdoor',
            'Instalasi pipa dan kabel',
            'Vacuum dan pengisian freon',
            'Testing dan komisioning',
            'Garansi pemasangan 6 bulan',
          ],
          'benefits': [
            'Pemasangan sesuai standar',
            'Performa AC maksimal',
            'Risiko kebocoran minimal',
          ],
        };
      case 'AC Copot':
      case 'ACCopot':
        return {
          'title': 'AC Copot',
          'price': 'Rp 250.000',
          'numericPrice': 'Rp 250.000',
          'desc':
              'Pembongkaran AC dengan aman tanpa merusak dinding atau komponen',
          'duration': 'Durasi: 60-90 menit',
          'includes': [
            'Pemompaan freon ke kompresor',
            'Pelepasan unit indoor & outdoor',
            'Pelepasan pipa dan kabel',
            'Penutupan bekas lubang pipa',
            'Pembersihan area kerja',
          ],
          'benefits': [
            'Proses aman dan rapi',
            'Tidak merusak dinding',
            'Freon tersimpan dengan baik',
          ],
        };
      case 'AC Inspeksi':
      case 'ACInspect':
      default:
        return {
          'title': 'AC Inspeksi',
          'price': 'Rp 100.000',
          'numericPrice': 'Rp 100.000',
          'desc':
              'Pemeriksaan kondisi AC secara menyeluruh dengan laporan detail',
          'duration': 'Durasi: 45-60 menit',
          'includes': [
            'Pemeriksaan kondisi fisik unit',
            'Pengecekan tekanan dan freon',
            'Analisa performa pendinginan',
            'Deteksi kebocoran',
            'Laporan kondisi lengkap',
          ],
          'benefits': [
            'Mengetahui kondisi AC',
            'Mencegah kerusakan besar',
            'Rekomendasi perawatan',
          ],
        };
    }
  }

  static void open(BuildContext context, String shortName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ServiceDetailScreen(serviceData: _getServiceDetails(shortName)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Image Header
          Stack(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  // We would uncomment this and use our placeholder when actual images are available
                  // image: const DecorationImage(
                  //   image: AssetImage('assets/images/placeholder.png'),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                left: 16,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                right: 16,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.share_outlined,
                      size: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content Wrapper
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        serviceData['title'],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          serviceData['price'],
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    serviceData['desc'],
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 18,
                        color: Colors.grey.shade500,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        serviceData['duration'],
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Yang Termasuk:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...List.generate(
                    (serviceData['includes'] as List).length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.check,
                            size: 18,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              serviceData['includes'][index],
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 13,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Manfaat:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...List.generate(
                    (serviceData['benefits'] as List).length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 18,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              serviceData['benefits'][index],
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 13,
                                height: 1.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Biaya',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    serviceData['numericPrice'],
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Booking Sekarang',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
