import 'package:flutter/material.dart';

class Mygamescreen extends StatelessWidget {
  const Mygamescreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my game screen'),
        centerTitle: true,
        backgroundColor: const Color(0xFF7E57C2),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Welcom to My Game!'),
      ),
    );
  }
}
