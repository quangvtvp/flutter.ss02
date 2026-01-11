import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:lesson14_member_funny_game/nguyenvietthuc/member_screen_v1_stateless_form.dart';
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
import 'package:lesson14_member_funny_game/PhamVanDuong/member_screen_v1_stateless_form.dart';
import 'package:lesson14_member_funny_game/thuannd/member_screen_v1_stateless_form.dart'
    hide MemberFunnyGameScreenV1;
=======
import 'package:lesson14_member_funny_game/thuannd/lesson-13-stateful/color_picker.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-13-stateful/lightbuld.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-14-listview-gridview/color-selector.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-14-listview-gridview/grid-game.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-14-listview-gridview/simple_grid.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-14-listview-gridview/simple_horizontal_list.dart';
>>>>>>> 0c7db0626eb59dfbe499e904b3fa0bf31969fb8a
import 'package:lesson14_member_funny_game/thuannd/member_screen_v1_stateless_form.dart';
import 'package:lesson14_member_funny_game/thuannd/member_screen_v2_stateless_list.dart';
>>>>>>> 7dd4b014e98195ab1484d14944c75eb05c7f46c7
import 'package:lesson14_member_funny_game/thuannd/member_screen_v5_gemini.dart';
=======
import 'package:lesson14_member_funny_game/thuannd/lesson-14-listview-gridview/grid-game.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-14-listview-gridview/simple_grid.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-15-mini-game/cardgame.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-15-mini-game/memory_game_v1_basic.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-15-mini-game/memory_game_v2_match.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-15-mini-game/memory_game_v3_animation.dart';
import 'package:lesson14_member_funny_game/thuannd/lesson-15-mini-game/memory_game_v4_sound.dart';

import 'thuannd/lesson-14-listview-gridview/simplelistview.dart';
>>>>>>> 0789a158551e6eaabfeece14e00477e1eec76dc6

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
      home: const ThucMemberFunnyGameScreenV1(),
=======
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Demo')),
        body: const MyWidget(),
      ),
>>>>>>> 0c7db0626eb59dfbe499e904b3fa0bf31969fb8a
    );
  }
}
