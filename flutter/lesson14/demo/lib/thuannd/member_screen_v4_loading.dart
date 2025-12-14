import 'package:flutter/material.dart';

import '../models/member.dart';

// VERSION 4: StatefulWidget - Thêm loading modal với delay
// Mục tiêu: Học cách hiển thị loading và xử lý bất đồng bộ (async/await)
// Khi nhấn nút, hiển thị loading 3 giây rồi mới thêm thành viên

class MemberFunnyGameScreen extends StatefulWidget {
  const MemberFunnyGameScreen({super.key});

  @override
  State<MemberFunnyGameScreen> createState() => _MemberFunnyGameScreenState();
}

class _MemberFunnyGameScreenState extends State<MemberFunnyGameScreen> {
  // Biến trạng thái - danh sách thành viên
  List<Member> _members = [];

  // Controller để lấy giá trị từ TextField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  // Hàm thêm thành viên với loading
  Future<void> _addMember() async {
    final name = _nameController.text.trim();
    final desc = _descController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên!')),
      );
      return;
    }

    // Hiển thị loading modal
    showDialog(
      context: context,
      barrierDismissible: false, // Không cho phép đóng khi nhấn bên ngoài
      builder: (context) {
        return const PopScope(
          canPop: false, // Không cho phép back khi đang loading
          child: Center(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );

    // Giả lập delay 3 giây (ví dụ: gọi API)
    await Future.delayed(const Duration(seconds: 3));

    // Kiểm tra widget còn mounted không trước khi dùng context
    if (!mounted) return;

    // Đóng loading modal
    Navigator.of(context).pop();

    final newMember = Member(
      name: name,
      description: desc.isEmpty ? 'Chưa có mô tả' : desc,
    );

    // Cập nhật danh sách
    setState(() {
      _members = [..._members, newMember];
    });

    // Xóa nội dung trong TextField sau khi thêm
    _nameController.clear();
    _descController.clear();
  }

  @override
  void dispose() {
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
