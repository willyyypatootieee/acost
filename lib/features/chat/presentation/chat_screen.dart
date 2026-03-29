import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'widgets/chat_filter_tabs.dart';
import 'widgets/chat_list_item.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedTabIndex = 0;

  final List<Map<String, dynamic>> _chats = [
    {
      'name': 'Teknisi Budi',
      'orderId': 'Order #AC12345678',
      'message': 'Baik, saya akan datang tepat waktu. Terima...',
      'time': '10:30',
      'unreadCount': 2,
      'avatarText': 'TB',
      'avatarColor': Colors.black87,
      'roleIcon': Icons.build,
      'isOnline': true,
    },
    {
      'name': 'Customer Service',
      'orderId': null,
      'message': 'Apakah ada yang bisa kami bantu?',
      'time': 'Kemarin',
      'unreadCount': 0,
      'avatarText': 'CS',
      'avatarColor': AppColors.primary,
      'roleIcon': Icons.chat_bubble_outline,
      'isOnline': true,
    },
    {
      'name': 'Teknisi Ahmad',
      'orderId': 'Order #AC87654321',
      'message': 'Pekerjaan sudah selesai dengan baik',
      'time': '2 hari lalu',
      'unreadCount': 0,
      'avatarText': 'TA',
      'avatarColor': Colors.blue,
      'roleIcon': Icons.build,
      'isOnline': false,
    },
    {
      'name': 'Admin AC Service',
      'orderId': null,
      'message': 'Pembayaran Anda telah berhasil diverifikasi',
      'time': '3 hari lalu',
      'unreadCount': 0,
      'avatarText': 'AA',
      'avatarColor': Colors.lightBlue,
      'roleIcon': Icons.settings,
      'isOnline': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing:
            16, // gives left alignment padding relative to where the back button should implicitly be if it existed
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pesan',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '2 pesan belum dibaca',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.textPrimary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          ChatFilterTabs(
            selectedIndex: _selectedTabIndex,
            onTabChanged: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                if (_selectedTabIndex == 0) _buildTipsCard(),
                const SizedBox(height: 4),
                ..._chats.map((chat) {
                  if (_selectedTabIndex == 1 && chat['unreadCount'] == 0) {
                    return const SizedBox.shrink();
                  }

                  // If filtering for unread, check where the tip card goes logically
                  // based on the design it appears below the unread messages
                  final isUnreadFilter = _selectedTabIndex == 1;

                  return Column(
                    children: [
                      ChatListItem(
                        name: chat['name'],
                        orderId: chat['orderId'],
                        message: chat['message'],
                        time: chat['time'],
                        unreadCount: chat['unreadCount'],
                        avatarText: chat['avatarText'],
                        avatarColor: chat['avatarColor'],
                        roleIcon: chat['roleIcon'],
                        isOnline: chat['isOnline'],
                      ),
                      if (isUnreadFilter && chat == _chats.first) ...[
                        _buildTipsCard(),
                      ],
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FAFA), // Soft cyan background
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.access_time_outlined,
              color: Color(0xFF0CA789),
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tips Berkomunikasi',
                  style: TextStyle(
                    color: Color(0xFF0CA789), // Darker cyan text
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Teknisi kami siap membantu Anda. Jangan ragu untuk bertanya tentang layanan atau memberikan instruksi khusus.',
                  style: TextStyle(
                    color: const Color(0xFF0CA789),
                    fontSize: 11,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
