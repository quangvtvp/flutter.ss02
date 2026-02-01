import 'dart:math';

import 'package:flutter/material.dart';

import '../models/member.dart';

// Màn hình chính của mini game (StatelessWidget)
// Sử dụng ValueNotifier để cập nhật danh sách mà không cần chuyển thành StatefulWidget
// Đây là cách quản lý trạng thái đơn giản, hiệu quả cho người mới bắt đầu
class MemberFunnyGameScreen extends StatelessWidget {
  MemberFunnyGameScreen({super.key});

  // 1. Biến trạng thái chứa danh sách thành viên
  // ValueNotifier sẽ thông báo cho giao diện biết khi dữ liệu thay đổi
  final ValueNotifier<List<Member>> _membersNotifier = ValueNotifier([]);

  // Controller nhập liệu (trong StatelessWidget ta chấp nhận không dispose cho đơn giản)
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final Random _random = Random();

  // Danh sách nghề nghiệp hài hước
  final List<String> _funnyJobs = const [
    'Chuyên gia săn sale Shopee 1k',
    'Tổng thống nước Ngủ Ngày',
    'Tiến sĩ văn học chuyên ngành chém gió',
    'Vận động viên lướt Facebook Olympic',
    'Nhà phê bình ẩm thực căng tin',
    'Đại sứ thương hiệu trà sữa trân châu',
    'Kỹ sư xây dựng lâu đài trên cát',
    'Thám tử tư chuyên soi crush',
    'Nghệ sĩ hài độc thoại trong giờ học',
    'Thủ khoa đầu thai ngành may mắn',
  ];

  // Hàm tạo màu avatar ngẫu nhiên (Purple Theme)
  Color _randomAvatarColor() {
    final colors = [
      const Color(0xFFD1C4E9), // Tím nhạt
      const Color(0xFFB39DDB), // Tím vừa
      const Color(0xFF9575CD), // Tím đậm
      const Color(0xFF7E57C2), // Tím xanh
      const Color(0xFFCE93D8), // Tím hồng nhạt
      const Color(0xFFBA68C8), // Tím hồng vừa
      const Color(0xFFAB47BC), // Tím hồng đậm
      const Color(0xFFF48FB1), // Hồng tím
    ];
    return colors[_random.nextInt(colors.length)];
  }

  // Hàm thêm thành viên
  void _addMember(BuildContext context) {
    final name = _nameController.text.trim();
    final desc = _descController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên để xem bói nhé!')),
      );
      return;
    }

    final safeDesc = desc.isEmpty ? 'Người bạn bí ẩn chưa có mô tả' : desc;
    final funnyJob = _funnyJobs[_random.nextInt(_funnyJobs.length)];

    final newMember = Member(
      name: name,
      description: safeDesc,
      funnyJob: funnyJob,
      avatarColor: _randomAvatarColor(),
    );

    // CẬP NHẬT TRẠNG THÁI:
    // Tạo một danh sách mới chứa phần tử cũ + phần tử mới
    // Việc gán giá trị mới cho .value sẽ kích hoạt ValueListenableBuilder vẽ lại UI
    _membersNotifier.value = [..._membersNotifier.value, newMember];

    _nameController.clear();
    _descController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Máy Tiên Tri Nghề Nghiệp'),
              centerTitle: true,
              backgroundColor: const Color(0xFF7E57C2),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1. Form nhập thông tin
                  _formInfo(context),

                  const SizedBox(height: 16),

                  const Text(
                    'Kết quả dự đoán nghề nghiệp',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 2. Danh sách thành viên
                  // Dùng ValueListenableBuilder để lắng nghe thay đổi từ _membersNotifier
                  // Chỉ có phần này được vẽ lại khi danh sách thay đổi
                  Expanded(
                    child: ValueListenableBuilder<List<Member>>(
                      valueListenable: _membersNotifier,
                      builder: (context, members, child) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              for (final member in members) _MemberCard(member: member),
                              if (members.isEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 32.0),
                                  child: Text(
                                    'Chưa có ai được tiên tri, hãy nhập tên để bắt đầu!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget Form nhập liệu
  Widget _formInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFB39DDB), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB39DDB).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Nhập thông tin để tiên tri',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7E57C2),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Tên',
              hintText: 'Nhập tên người cần xem bói',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              prefixIcon: Icon(Icons.person_outline, color: Color(0xFF7E57C2)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF7E57C2), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelStyle: TextStyle(color: Color(0xFF7E57C2)),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _descController,
            decoration: const InputDecoration(
              labelText: 'Mô tả ngắn',
              hintText: 'VD: siêu hài hước, trùm toán, ngủ nhiều...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              prefixIcon: Icon(Icons.description_outlined, color: Color(0xFF7E57C2)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF7E57C2), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelStyle: TextStyle(color: Color(0xFF7E57C2)),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () => _addMember(context),
                icon: const Icon(Icons.auto_awesome),
                label: const Text('Dự đoán ngay'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7E57C2),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget hiển thị thẻ thành viên
class _MemberCard extends StatelessWidget {
  final Member member;

  const _MemberCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: member.avatarColor,
            child: Text(
              member.name.isNotEmpty ? member.name[0].toUpperCase() : '?',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  member.description,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.work_outline,
                      size: 16,
                      color: Colors.teal,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Nghề nghiệp tương lai: ${member.funnyJob}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
