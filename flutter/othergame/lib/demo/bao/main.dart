import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';   // The import of 'package:flutter/widgets.dart' is unnecess...

void main(List<String> args) {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: BodyScreen()),
    ),
  );
}

class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(width: 1, height: 1, color: const Color.fromARGB(255, 159, 140, 138)),
            Container(width: 550, height: 900, color: Colors.green),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 100, height: 100, color: const Color.fromARGB(255, 63, 63, 61)),
            Container(width: 100, height: 100, color: Colors.purple),
            Container(width: 100, height: 100, color: Colors.orange),
          ],
        ),
      ],
    );
  }
}
