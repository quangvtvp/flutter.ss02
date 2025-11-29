import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minhduc/my_game_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyGameScreen(),
    );
  }
}
class Member {
  final String name; // Tên người chơi
  final String description; // Mô tả bản thân
  final String funnyJob; // Nghề nghiệp được dự đoán (kết quả)
  final Color avatarColor; // Màu đại diện ngẫu nhiên

  Member({
    required this.name,
    required this.description,
    required this.funnyJob,
    required this.avatarColor,
  });
}

class MemberData extends ChangeNotifier {
  final TextEditingController _nameController;
  final TextEditingController _descriptionController; 
  final List<Member> _members;
  final Random _random;
  static const List<String> _funnyJobs = <String>[
    'Thám tử mèo',
    'Thợ săn kho báu dưới gầm giường',
    'Chuyên gia nếm thử bánh quy miễn phí',
    'Kỹ sư xây dựng lâu đài cát',
    'Người hướng dẫn giấc mơ',
    'Nghệ sĩ vẽ mây',
    'Chuyên gia giải mã tiếng ngáy',
    'Người chế tạo cầu vồng',
    'Thủ thư thư viện truyện cười',
    'Giáo sư nghiên cứu về sự lười biếng',
  ];

  MemberData()
      : _nameController = TextEditingController(),
        _descriptionController = TextEditingController(), 
        _members = <Member>[],
        _random = Random();

  TextEditingController get nameController => _nameController;
  TextEditingController get descriptionController => _descriptionController; 
  List<Member> get members => _members;

  Color _generateRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  String _predictFunnyJob(String name) {
    return _funnyJobs[_random.nextInt(_funnyJobs.length)];
  }

  void predictJob() {
    final String name = _nameController.text.trim();
    final String description = _descriptionController.text.trim(); 
    if (name.isEmpty) {
    }

    final String funnyJob = _predictFunnyJob(name);
    final Color avatarColor = _generateRandomColor();

    _members.insert(
        0, 
        Member(
          name: name,
          description: description.isNotEmpty ? description : 'Không có mô tả',
          funnyJob: funnyJob,
          avatarColor: avatarColor,
        ));

    _nameController.clear();
    _descriptionController.clear(); 

    notifyListeners();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose(); 
    super.dispose();
  }
}
