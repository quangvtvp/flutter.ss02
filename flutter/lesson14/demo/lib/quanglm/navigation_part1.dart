import 'package:flutter/material.dart';
import '../thuannd/lesson-13-stateful/lightbuld.dart';
import '../thuannd/lesson-13-stateful/color_picker.dart';

// FILE 1: Cấu trúc cơ bản và Level 1 (Điều hướng đơn giản)
// Mục tiêu: Giới thiệu Navigator.push, Navigator.pop và ListView

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: NavigationMenuV1()));
}

class NavigationMenuV1 extends StatelessWidget {
  const NavigationMenuV1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bài 17: Navigation (Phần 1)"), backgroundColor: Colors.blue.shade100),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // HEADER LEVEL 1
          const Text("Level 1: Điều hướng cơ bản", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          // ----- 1. Điều hướng đến màn hình Bật Đèn -----
          Card(
            child: ListTile(
              leading: const Icon(Icons.lightbulb, color: Colors.amber),
              title: const Text("Bài tập Bật Đèn"),
              subtitle: const Text("Ví dụ về Navigator.push đơn giản"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // CODE CHÍNH CẦN HỌC:
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LightBulb()));
              },
            ),
          ),

          // ----- 2. Điều hướng đến màn hình Chọn Màu -----
          Card(
            child: ListTile(
              leading: const Icon(Icons.color_lens, color: Colors.purple),
              title: const Text("Bài tập Chọn Màu"),
              subtitle: const Text("Mở màn hình thứ 2"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ColorPicker()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
