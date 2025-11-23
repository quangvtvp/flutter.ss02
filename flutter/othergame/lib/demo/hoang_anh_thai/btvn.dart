import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('My Flutter App'))),
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Align boxes to the top',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Center all boxes',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Align boxes to the bottom',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Space between boxes',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Space around each boxes',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Equal space evenly',
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
