import 'package:flutter/material.dart';
import 'package:lesson14_member_funny_game/services/gemini_service.dart';

import '../models/member.dart';
import '../services/gemini_service.dart';

// VERSION 5: Tích hợp Gemini AI để gợi ý ngành học
// Mục tiêu: Học cách gọi API và xử lý kết quả bất đồng bộ
// Khi nhấn nút, gọi Gemini API để phân tích và gợi ý ngành học

class MemberFunnyGameScreenV5 extends StatefulWidget {
  final String? name;
  final String? desc;
  const MemberFunnyGameScreenV5({super.key, this.name, this.desc});

  @override
  State<MemberFunnyGameScreenV5> createState() =>
      _MemberFunnyGameScreenV5State();
}

class _MemberFunnyGameScreenV5State extends State<MemberFunnyGameScreenV5> {
  // Biến trạng thái - danh sách thành viên
  List<Member> _members = [];

  // Controller để lấy giá trị từ TextField
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  initState() {
    super.initState();
    if (widget.name != null) {
      _nameController.text = widget.name!;
    }
    if (widget.desc != null) {
      _descController.text = widget.desc!;
    }
  }
  // Hàm thêm thành viên với gọi Gemini API
  Future<void> _addMember() async {
    

    final name = _nameController.text.trim();
    final desc = _descController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Vui lòng nhập tên!')));
      return;
    }

    if (desc.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập đặc điểm để AI phân tích!'),
        ),
      );
      return;
    }

    // Hiển thị loading modal
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const PopScope(
          canPop: false,
          child: Center(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Đang phân tích với AI...'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    try {
      // Gọi Gemini API để gợi ý ngành học
      final suggestion = await GeminiService.suggestMajor(
        name: name,
        description: desc,
      );

      // Kiểm tra widget còn mounted không
      if (!mounted) return;

      // Đóng loading modal
      Navigator.of(context).pop();

      // Tạo member mới với idealJob là kết quả từ AI
      final newMember = Member(
        name: name,
        description: desc,
        idealJob: suggestion,
      );

      // Cập nhật danh sách
      setState(() {
        _members = [..._members, newMember];
      });

      // Xóa nội dung trong TextField
      _nameController.clear();
      _descController.clear();
    } catch (e) {
      // Đóng loading nếu có lỗi
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
      }
    }
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
        title: const Text('AI Gợi Ý Ngành Học'),
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
                hintText: 'Nhập tên học sinh',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: 'Đặc điểm',
                hintText: 'VD: thông minh, thích toán, tư duy logic tốt...',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _addMember,
              icon: const Icon(Icons.auto_awesome),
              label: const Text('Phân tích với AI'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7E57C2),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),

            const SizedBox(height: 24),

            // 2. Tiêu đề danh sách
            const Text(
              'Kết quả phân tích:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // 3. Danh sách kết quả - Dùng ListTile giống V4
            Expanded(
              child: _members.isEmpty
                  ? const Center(
                      child: Text('Nhập thông tin và nhấn "Phân tích với AI"'),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          for (final member in _members)
                            Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: const Color(0xFF7E57C2),
                                  child: Text(
                                    member.name[0].toUpperCase(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                title: Text(
                                  '${member.name} - ${member.description}',
                                ),
                                subtitle: Text(
                                  member.idealJob ?? 'Đang chờ phân tích...',
                                ),
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
