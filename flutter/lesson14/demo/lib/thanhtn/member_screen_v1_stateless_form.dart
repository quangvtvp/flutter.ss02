import 'package:flutter/material.dart';

// VERSION 1: StatelessWidget - Chỉ hiển thị Form
// Mục tiêu: Học cách tạo giao diện cơ bản với TextField và Button
// Chưa có tương tác, chưa có danh sách

class ThanhntMemberFunnyGameScreenV1 extends StatelessWidget {
  const ThanhntMemberFunnyGameScreenV1({super.key});

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
            const TextField(
              decoration: InputDecoration(
                labelText: 'Tên',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Mô tả',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // Chưa làm gì cả - sẽ thêm ở version 3
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7E57C2),
                foregroundColor: Colors.white,
              ),
              child: const Text('Thêm thành viên'),
            ),
          ],
        ),
      ),
    );
  }
}
