import 'package:flutter/material.dart';

import 'package:lesson14_member_funny_game/thuannd/lesson-15-mini-game/memory_game_v4_sound.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-14-listview-gridview/simplelistview.dart';
<<<<<<< HEAD
import 'package:lesson14_member_funny_game/thuannd/lesson-15-mini-game/Minh%20bao/cardsgame.dart';

=======
import 'package:lesson14_member_funny_game/thuannd/lesson-15-mini-game/memory_game_v4_sound.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-15-mini-game/student-name/my_card_game.dart';
>>>>>>> ea081d3bb7771c067f5661af63d39388019e8c25

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
<<<<<<< HEAD
      home: const Cardsgame(),
=======
      home: const MemoryGameV4Sound(),
>>>>>>> ea081d3bb7771c067f5661af63d39388019e8c25
    );
  }
}
