import 'package:flutter/material.dart';
import 'package:dongcuong/hinh.dart';

void main() {
  runApp(const MyGame());
}

class MyGame extends StatelessWidget {
  const MyGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyGameScreen(),
    );
  }
}
