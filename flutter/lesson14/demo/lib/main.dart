import 'package:flutter/material.dart';
import 'package:lesson14_member_funny_game/PhamVanDuong/color.dart';
import 'package:lesson14_member_funny_game/PhamVanDuong/light.dart';
import 'package:lesson14_member_funny_game/PhamVanDuong/minigame2.dart';
import 'package:lesson14_member_funny_game/PhamVanDuong/minigame1.dart';
import 'package:lesson14_member_funny_game/PhamVanDuong/simplelistview.dart';

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
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter demo')),
        body: MyWidget(), // Thay đổi
      ),
    );
  }
}
