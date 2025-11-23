import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 100, height: 100, color: Colors.red),
        Container(width: 100, height: 100, color: Colors.green),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 100, height: 100, color: Colors.yellow),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 201, 118, 34),
            ),
            Container(width: 100, height: 100, color: Colors.orange),
          ],
        ),
      ],
    );
  }
}
