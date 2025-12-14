import 'package:flutter/material.dart';

class MyGameScreen extends StatelessWidget {
  const MyGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Game Screen'),
        backgroundColor: const Color.fromARGB(255, 108, 0, 116),
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Welcome to My Game!')),
    );
  }
}
