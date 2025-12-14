import 'package:flutter/material.dart';

import '../models/member.dart';

// VERSION 3: StatefulWidget - Form + Danh sách động + setState
// Mục tiêu: Học cách quản lý trạng thái với StatefulWidget và setState
// Khi nhấn nút, thêm thành viên mới vào danh sách và cập nhật giao diện

class MemberFunnyGameScreenV3 extends StatefulWidget {
  const MemberFunnyGameScreenV3({super.key});

  @override
  State<MemberFunnyGameScreenV3> createState() =>
      _MemberFunnyGameScreenV3State();
}

class _MemberFunnyGameScreenV3State extends State<MemberFunnyGameScreenV3> {
  // Biến trạng thái - danh sách thành viên
  List<Member> _members = [];

  // Controller để lấy giá trị từ TextField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  // Hàm thêm thành viên
  void _addMember() {
    final name = _nameController.text.trim();
    final desc = _descController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên!')),
      );
      return;
    }

    final newMember = Member(
      name: name,
      description: desc.isEmpty ? 'Chưa có mô tả' : desc,
    );

    // GỌI setState ĐỂ CẬP NHẬT GIAO DIỆN
    // Khi setState được gọi, Flutter sẽ chạy lại hàm build()
    // và vẽ lại giao diện với dữ liệu mới
    setState(() {
      _members = [..._members, newMember];
    });

    // Xóa nội dung trong TextField sau khi thêm
    _nameController.clear();
    _descController.clear();
  }

  @override
  void dispose() {
    // Giải phóng controller khi widget bị hủy
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách thành viên'),
        centerTitle: true,
        backgroundColor: const Color(0xFF7E57C2),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Form nhập thông tin
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Tên',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: 'Mô tả',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _addMember, // Gọi hàm _addMember khi nhấn nút
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7E57C2),
                foregroundColor: Colors.white,
              ),
              child: const Text('Thêm thành viên'),
            ),

            const SizedBox(height: 24),

            // 2. Tiêu đề danh sách
            const Text(
              'Danh sách:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // 3. Danh sách thành viên
            Expanded(
              child: _members.isEmpty
                  ? const Center(
                      child: Text('Chưa có thành viên nào'),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          for (final member in _members)
                            Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Text(member.name[0].toUpperCase()),
                                ),
                                title: Text(member.name),
                                subtitle: Text(member.description),
                              ),
                            ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
