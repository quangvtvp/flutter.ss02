import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Flutter App')),
        body: const AxisAlignmentDemo(),
      ),
    );
  }
}

// grid color layout 3 x 3 with border using columns and rows and containers
class ColorGrid3x3 extends StatelessWidget {
  const ColorGrid3x3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// building a column with multiple rows, each row contain three containers with different colors that demonstrate different axis alignments for educational purpose
class AxisAlignmentDemo extends StatelessWidget {
  const AxisAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1: Align boxes to the left
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Align boxes to the left',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width: 80, color: Colors.red),
                    Container(width: 80, color: Colors.green),
                    Container(width: 80, color: Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Row 2: Center all boxes
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Center all boxes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 80, color: Colors.orange),
                    Container(width: 80, color: Colors.purple),
                    Container(width: 80, color: Colors.cyan),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Row 3: Align boxes to the right
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Align boxes to the right',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(width: 80, color: Colors.pink),
                    Container(width: 80, color: Colors.amber),
                    Container(width: 80, color: Colors.teal),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Row 4: Space between boxes (no space at edges)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Space between boxes (no space at edges)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 80, color: Colors.indigo),
                    Container(width: 80, color: Colors.lime),
                    Container(width: 80, color: Colors.brown),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Row 5: Equal space around each box
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Equal space around each box',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(width: 80, color: Colors.deepOrange),
                    Container(width: 80, color: Colors.lightBlue),
                    Container(width: 80, color: Colors.lightGreen),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Row 6: Equal space between all boxes including edges
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Equal space between all boxes including edges',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(width: 80, color: Colors.deepPurple),
                    Container(width: 80, color: Colors.yellowAccent),
                    Container(width: 80, color: Colors.blueGrey),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// building a row with multiple columns that demonstrate different axis alignments for educational purpose
class ColumnAlignmentDemo extends StatelessWidget {
  const ColumnAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Column 1: Align boxes to the top
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Align boxes to the top',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(height: 60, width: 60, color: Colors.red),
                    Container(height: 60, width: 60, color: Colors.green),
                    Container(height: 60, width: 60, color: Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Column 2: Center all boxes
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Center all boxes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 60, width: 60, color: Colors.orange),
                    Container(height: 60, width: 60, color: Colors.purple),
                    Container(height: 60, width: 60, color: Colors.cyan),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Column 3: Align boxes to the bottom
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Align boxes to the bottom',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(height: 60, width: 60, color: Colors.pink),
                    Container(height: 60, width: 60, color: Colors.amber),
                    Container(height: 60, width: 60, color: Colors.teal),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Column 4: Space between boxes
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Space between boxes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: 60, width: 60, color: Colors.indigo),
                    Container(height: 60, width: 60, color: Colors.lime),
                    Container(height: 60, width: 60, color: Colors.brown),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Column 5: Equal space around
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Space around each box',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(height: 60, width: 60, color: Colors.deepOrange),
                    Container(height: 60, width: 60, color: Colors.lightBlue),
                    Container(height: 60, width: 60, color: Colors.lightGreen),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Column 6: Equal space evenly
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Equal space evenly',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(height: 60, width: 60, color: Colors.deepPurple),
                    Container(
                      height: 60,
                      width: 60,
                      color: Colors.yellowAccent,
                    ),
                    Container(height: 60, width: 60, color: Colors.blueGrey),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// grid color layout 4 x 4 with different colors using columns and rows and containers
class ColorGrid extends StatelessWidget {
  const ColorGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: List.generate(4, (rowIndex) {
          return Expanded(
            child: Row(
              children: List.generate(4, (colIndex) {
                return Expanded(
                  child: Container(
                    color: Color.fromARGB(
                      255,
                      (rowIndex * 64) % 256,
                      (colIndex * 64) % 256,
                      ((rowIndex + colIndex) * 32) % 256,
                    ),
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
