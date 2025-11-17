import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nguyen Viet Thuc Demo'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: const Center(child: Text('Hello, Nguyen Viet Thuc!')),
      ),
    ),
  );
}

class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
