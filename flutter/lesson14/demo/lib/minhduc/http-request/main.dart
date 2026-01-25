import 'package:flutter/material.dart';
import 'package:lesson14_member_funny_game/thuannd/http-request/todo.dart';
void main() {
  runApp(const MemberFunnyGameApp());
}
class MemberFunnyGameApp extends StatelessWidget {
  const MemberFunnyGameApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TodoListWidget(),
    );
  }
}