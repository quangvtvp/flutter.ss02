import 'package:flutter/material.dart';

import '../models/member.dart';

// Màn hình chính của mini game (StatefulWidget)
// Sử dụng StatefulWidget và setState để cập nhật danh sách
// Đây là cách quản lý trạng thái cơ bản trong Flutter
class MemberFunnyGameScreen extends StatefulWidget {
  const MemberFunnyGameScreen({super.key});

  @override
  State<MemberFunnyGameScreen> createState() => _MemberFunnyGameScreenState();
}

class _MemberFunnyGameScreenState extends State<MemberFunnyGameScreen> {
  // 1. Biến trạng thái chứa danh sách thành viên
  // Khi gọi setState, Flutter sẽ vẽ lại giao diện với dữ liệu mới
  List<Member> _members = [];

  // Controller nhập liệu
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

    // CẬP NHẬT TRẠNG THÁI:
    // Gọi setState để thông báo cho Flutter vẽ lại giao diện
    // Đây là cách cơ bản để cập nhật UI trong StatefulWidget
    setState(() {
      _members = [..._members, newMember];
    });

    _nameController.clear();
    _descController.clear();
  }

  @override
  void dispose() {
    // Dispose controllers khi widget bị hủy để tránh memory leak
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
              onPressed: _addMember,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7E57C2),
                foregroundColor: Colors.white,
              ),
              child: const Text('Thêm thành viên'),
            ),

            const SizedBox(height: 24),

            // 2. Danh sách thành viên
            const Text(
              'Danh sách:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

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
