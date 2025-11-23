import 'package:flutter/material.dart';
import 'package:nguyen_viet_thuc/my_game_screen.dart';

void main() {
  runApp(const MyGame());
}

class MyGame extends StatelessWidget {
  const MyGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyGameScreen());
  }
}
