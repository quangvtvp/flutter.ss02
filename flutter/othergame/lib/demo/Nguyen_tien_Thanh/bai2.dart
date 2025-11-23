import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body:  BodySreen()),
    ),
  );  
}
class BodySreen extends StatelessWidget {
  const BodySreen({super.key});
  @override Widget buildRow(String title, MainAxisAlignment alignment, List<Color> colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: alignment,
          children: colors
              .map((c) => Container(
                    width: 40,
                    height: 40,
                    color: c,
                  ))
              .toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRow(
            "Align boxes to the left",
            MainAxisAlignment.start,
            [Colors.red, Colors.green, Colors.blue],
          ),
          const SizedBox(height: 30),
          buildRow(
            "Center all boxes",
            MainAxisAlignment.center,
            [Colors.orange, Colors.purple, Colors.cyan],
          ),
          const SizedBox(height: 30),
          buildRow(
            "Align boxes to the right",
            MainAxisAlignment.end,
            [Colors.pink, Colors.yellow, Colors.teal],
          ),
          const SizedBox(height: 30),
          buildRow(
            "Space between boxes (no space at edges)",
            MainAxisAlignment.spaceBetween,
            [Colors.indigo, Colors.lime, Colors.brown],
          ),
          const SizedBox(height: 30),
          buildRow(
            "Equal space around each box",
            MainAxisAlignment.spaceAround,
            [Colors.deepOrange, Colors.lightBlue, Colors.lightGreen],
          ),
          const SizedBox(height: 30),
          buildRow(
            "Equal space between all boxes including edges",
            MainAxisAlignment.spaceEvenly,
            [Colors.deepPurple, Colors.yellow, Colors.blueGrey],
          ),
        ],
      ),
    );
  }
}
