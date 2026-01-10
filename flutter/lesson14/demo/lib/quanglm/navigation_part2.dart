import 'package:flutter/material.dart';
import '../thuannd/lesson-13-stateful/lightbuld.dart';
import '../thuannd/lesson-13-stateful/color_picker.dart';
import '../thuannd/member_screen_v5_gemini.dart';

// FILE 2: Mở rộng thêm Level 2 (Truyền Dữ Liệu - Forward)
// Mục tiêu: Học cách truyền biến qua Constructor của màn hình mới

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: NavigationMenuV2()));
}

class NavigationMenuV2 extends StatelessWidget {
  const NavigationMenuV2({super.key});

  // Level 2: Hàm để hiện dialog nhập liệu và chuyển màn hình
  void _openGameWithData(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final nameCtrl = TextEditingController();
        final descCtrl = TextEditingController();
        return AlertDialog(
          title: const Text("Nhập hồ sơ học sinh"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: "Tên"),
              ),
              TextField(
                controller: descCtrl,
                decoration: const InputDecoration(labelText: "Mô tả"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Đóng dialog
              child: const Text("Hủy"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Bước 1: Đóng dialog trước

                // Bước 2: Chuyển màn hình + TRUYỀN DỮ LIỆU
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // Truyền data vào Constructor here
                    builder: (context) => MemberFunnyGameScreenV5(initialName: nameCtrl.text, initialDesc: descCtrl.text),
                  ),
                );
              },
              child: const Text("Gửi & Mở Game"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bài 17: Navigation (Part 2)"), backgroundColor: Colors.orange.shade100),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // LEVEL 1 (Code cũ)
          const Text("Level 1: Điều hướng cơ bản", style: _headerStyle),
          _buildLevel1Item(context, "Bài tập Bật Đèn", Icons.lightbulb, const LightBulb()),
          _buildLevel1Item(context, "Bài tập Chọn Màu", Icons.color_lens, const ColorPicker()),

          const Divider(height: 32),

          // LEVEL 2 (Mới thêm vào)
          const Text("Level 2: Truyền Dữ Liệu (Forward)", style: _headerStyle),
          const SizedBox(height: 10),
          Card(
            color: Colors.blue.shade50,
            child: ListTile(
              leading: const Icon(Icons.psychology, color: Colors.blue),
              title: const Text("AI Gợi Ý Nghề Nghiệp"),
              subtitle: const Text("Nhập Tên/Mô tả ở đây -> Submit -> Sang màn Game"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => _openGameWithData(context), // Gọi hàm xử lý logic
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper để code gọn hơn
  Widget _buildLevel1Item(BuildContext context, String title, IconData icon, Widget page) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
      ),
    );
  }

  static const _headerStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}
