import 'package:flutter/material.dart';
class MyGameScreen extends StatelessWidget {
  const MyGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Game Screen'),
        backgroundColor: const Color.fromARGB(255, 41, 84, 158),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Welcome to My Game!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}