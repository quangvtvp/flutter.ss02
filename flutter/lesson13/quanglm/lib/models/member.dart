import 'package:flutter/material.dart';

// Lớp đơn giản đại diện cho 1 thành viên trong game
// Đây là ví dụ rõ ràng về "Class" trong Dart
class Member {
  final String name; // tên bạn
  final String description; // mô tả ngắn
  final String funnyJob; // nghề nghiệp hài hước
  final Color avatarColor; // màu avatar ngẫu nhiên

  Member({
    required this.name,
    required this.description,
    required this.funnyJob,
    required this.avatarColor,
  });
}
