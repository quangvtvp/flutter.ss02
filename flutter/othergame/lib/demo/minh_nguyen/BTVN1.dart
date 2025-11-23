import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('BTVN 1 - Minh Nguyen')),
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
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 255, 0, 0),
            ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 0, 255, 0),
            ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 0, 0, 255),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 237, 108, 9),
            ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 171, 8, 171),
            ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 67, 182, 249),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 234, 49, 2),
            ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 243, 190, 45),
            ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 7, 226, 120),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 24, 74, 166),
            ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 13, 211, 9),
            ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 88, 63, 11),
            ),
          ],
        ),
      ],
    );
  }
}
