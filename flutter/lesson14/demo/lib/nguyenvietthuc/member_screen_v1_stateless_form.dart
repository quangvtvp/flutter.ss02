import 'package:flutter/material.dart';
import 'package:lesson14_member_funny_game/models/member.dart';
import 'package:lesson14_member_funny_game/services/gemini_service.dart';

// VERSION 1: StatelessWidget - Chỉ hiển thị Form
// Mục tiêu: Học cách tạo giao diện cơ bản với TextField và Button
// Chưa có tương tác, chưa có danh sách

class ThucMemberFunnyGameScreenV1 extends StatefulWidget {
  const ThucMemberFunnyGameScreenV1({super.key});

  @override
  State<ThucMemberFunnyGameScreenV1> createState() =>
      _ThucMemberFunnyGameScreenV1State();
}

class _ThucMemberFunnyGameScreenV1State
    extends State<ThucMemberFunnyGameScreenV1> {
  List<Member> members = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> addMember() async {
    final String name = _nameController.text;
    final String description = _descriptionController.text;

    showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );

    final suggestedMajors = await GeminiService.suggestMajor(
      name: name,
      description: description,
    );

    final newMember = Member(
      name: name,
      description: description,
      idealJob: suggestedMajors,
    );

    if (!mounted) return;
    Navigator.of(context).pop();

    setState(() {
      members = [...members, newMember];
      _nameController.clear();
      _descriptionController.clear();
    });
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
                // Chưa làm gì cả - sẽ thêm ở version 3
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7E57C2),
                foregroundColor: Colors.white,
              ),
              child: const Text('Thêm thành viên'),
            ),
            SizedBox(height: 12),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var member in members)
                      Card(
                        child: ListTile(
                          leading: CircleAvatar(child: Text(member.name[0])),
                          title: Text(member.name),
                          subtitle: Text(
                            member.idealJob ?? 'Chưa có nghề nghiệp phù hợp',
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
