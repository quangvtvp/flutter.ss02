import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Minh Nguyen')),
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
        Container(
          width: 150,
          height: 100,
          color: const Color.fromARGB(255, 248, 131, 123),
        ),
        Container(
          width: 150,
          height: 100,
          color: const Color.fromARGB(255, 100, 175, 255),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 248, 198, 123),
            ),
            Container(
              width: 100,
              height: 100,
              color: const Color.fromARGB(255, 100, 255, 190),
            ),
          ],
        ),
      ],
    );
  }
}
