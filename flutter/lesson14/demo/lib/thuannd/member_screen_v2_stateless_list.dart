import 'package:flutter/material.dart';

import '../models/member.dart';

// VERSION 2: StatelessWidget - Form + Danh sách cứng
// Mục tiêu: Học cách hiển thị danh sách với Column, for loop, ListTile
// Danh sách là dữ liệu cứng, chưa thể thêm mới

class MemberFunnyGameScreenV2 extends StatelessWidget {
  const MemberFunnyGameScreenV2({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu cứng - để minh họa cách hiển thị danh sách
    final List<Member> members = [
      Member(name: 'An', description: 'Học sinh chăm chỉ'),
      Member(name: 'Bình', description: 'Giỏi toán'),
      Member(name: 'Chi', description: 'Thích vẽ'),
    ];

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

            const SizedBox(height: 24),

            // 2. Tiêu đề danh sách
            const Text(
              'Danh sách:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // 3. Danh sách thành viên - sử dụng Column + for loop
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Dùng for loop để tạo các Card từ danh sách members
                    for (final member in members)
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
