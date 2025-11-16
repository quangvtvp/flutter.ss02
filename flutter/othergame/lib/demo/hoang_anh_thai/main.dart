import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(150, 112, 73, 73),
        body: BodyScreen(),
      ),
    ),
  );
}

class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 100, height: 100, color: Colors.red),
        Container(width: 100, height: 100, color: Colors.blue),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width: 100, height: 100, color: Colors.green),
            Container(width: 100, height: 100, color: Colors.yellow),
            Container(width: 100, height: 100, color: Colors.purple),
          ],
        ),
      ],
    );
  }
}
