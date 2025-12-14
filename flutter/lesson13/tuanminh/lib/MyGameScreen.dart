import 'package:flutter/material.dart';

class MyGameScreen extends StatelessWidget {
  const MyGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('My Game Screen')),
        backgroundColor: const Color.fromARGB(255, 11, 14, 11),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start),
      ),
    );
  }
}
