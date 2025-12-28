import 'package:flutter/material.dart';

import '../models/member.dart';

// VERSION 1: StatelessWidget - Chỉ hiển thị Form
// Mục tiêu: Học cách tạo giao diện cơ bản với TextField và Button
// Chưa có tương tác, chưa có danh sách

class MemberFunnyGameScreenV1 extends StatefulWidget {
  const MemberFunnyGameScreenV1({super.key});

  @override
  State<MemberFunnyGameScreenV1> createState() =>
      _MemberFunnyGameScreenV1State();
}

class _MemberFunnyGameScreenV1State extends State<MemberFunnyGameScreenV1> {
  List<Member> members = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> addMember() async {
    final name = _nameController.text;
    final description = _descriptionController.text;

    final newMember = Member(name: name, description: description);

    showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;
    Navigator.of(context).pop(); // Đóng loading modal

    setState(() {
      members = [...members, newMember];
    });
    _nameController.clear();
    _descriptionController.clear();
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
            // Form nhập thông tin
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Tên',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Mô tả',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                addMember();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7E57C2),
                foregroundColor: Colors.white,
              ),
              child: const Text('Thêm thành viên'),
            ),
            SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (final member in members)
                      Card(
                        child: ListTile(
                          title: Text(member.name),
                          subtitle: Text(member.description),
                          leading: CircleAvatar(child: Text(member.name[0])),
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
