import 'package:flutter/material.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-14-listview-gridview/simplelistview.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-15-mini-game/student-name/my_card_game.dart';
import 'package:lesson14_member_funny_game/thuannd/sqlight/todo.dart';
import 'package:lesson14_member_funny_game/thuannd/sqlight/todo_v2.dart';

// HÀM main là điểm bắt đầu của ứng dụng Flutter
void main() {
  runApp(const MemberFunnyGameApp());
}

// Widget gốc của ứng dụng
// Ở đây dùng StatelessWidget vì phần cấu hình app không thay đổi
class MemberFunnyGameApp extends StatelessWidget {
  const MemberFunnyGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Mini Game Thành Viên Hài Hước',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      //   useMaterial3: true,
      // ),
      // home trỏ tới màn hình game chính đã tách riêng trong folder screens
      home: const TodoListV2(),
    );
  }
}
