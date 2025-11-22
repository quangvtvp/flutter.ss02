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
  @override
  Widget buildColumn(String title, MainAxisAlignment alignment, List<Color> colors) {
    return Column(
      mainAxisAlignment: alignment,
      children: [
        ...colors.map((c) => Container(
              width: 50,
              height: 50,
              color: c,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildColumn(
            "Align to top",
            MainAxisAlignment.start,
            [Colors.red, Colors.green, Colors.blue],
          ),
          buildColumn(
            "Center",
            MainAxisAlignment.center,
            [Colors.orange, Colors.purple, Colors.cyan],
          ),
          buildColumn(
            "Bottom",
            MainAxisAlignment.end,
            [Colors.pink, Colors.yellow, Colors.teal],
          ),
          buildColumn(
            "Space between",
            MainAxisAlignment.spaceBetween,
            [Colors.indigo, Colors.lightGreen],
          ),
          buildColumn(
            "Space around",
            MainAxisAlignment.spaceAround,
            [Colors.orange, Colors.blue, Colors.lightGreen],
          ),
          buildColumn(
            "Evenly",
            MainAxisAlignment.spaceEvenly,
            [Colors.purple, Colors.yellow, Colors.grey],
          ),
        ],
      ),
    );
  }
}