import 'package:flutter/material.dart';

class MyGameScreen extends StatelessWidget {
  const MyGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Game'),
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        foregroundColor: Color(0xFFFFFFFF),
      ),
      body: const Center(child: Text('Game screen')),
    );
  }
}
