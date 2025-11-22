import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

/// A 3x3 grid of containers with black borders, demonstrating basic grid layout.
class ColorGrid3x3 extends StatelessWidget {
  const ColorGrid3x3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(3, (rowIdx) {
        return Expanded(
          child: Row(
            children: List<Widget>.generate(3, (colIdx) {
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}

/// Data model for a single row alignment example.
class RowAlignmentExample {
  final String title;
  final MainAxisAlignment alignment;
  final List<Color> colors;

  const RowAlignmentExample({
    required this.title,
    required this.alignment,
    required this.colors,
  });
}

/// Data source for various row alignment examples.
class RowAlignmentData {
  static const List<RowAlignmentExample> examples = [
    RowAlignmentExample(
      title: 'Align boxes to the left',
      alignment: MainAxisAlignment.start,
      colors: [Colors.red, Colors.green, Colors.blue],
    ),
    RowAlignmentExample(
      title: 'Center all boxes',
      alignment: MainAxisAlignment.center,
      colors: [Colors.orange, Colors.purple, Colors.cyan],
    ),
    RowAlignmentExample(
      title: 'Align boxes to the right',
      alignment: MainAxisAlignment.end,
      colors: [Colors.pink, Colors.amber, Colors.teal],
    ),
    RowAlignmentExample(
      title: 'Space between boxes (no space at edges)',
      alignment: MainAxisAlignment.spaceBetween,
      colors: [Colors.indigo, Colors.lime, Colors.brown],
    ),
    RowAlignmentExample(
      title: 'Equal space around each box',
      alignment: MainAxisAlignment.spaceAround,
      colors: [Colors.deepOrange, Colors.lightBlue, Colors.lightGreen],
    ),
    RowAlignmentExample(
      title: 'Equal space between all boxes including edges',
      alignment: MainAxisAlignment.spaceEvenly,
      colors: [Colors.deepPurple, Colors.yellowAccent, Colors.blueGrey],
    ),
  ];
}

/// Displays a single row alignment example based on provided data.
class RowAlignmentViewer extends StatelessWidget {
  final RowAlignmentExample example;

  const RowAlignmentViewer({super.key, required this.example});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              example.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: example.alignment,
              children: example.colors
                  .map<Widget>(
                    (Color color) => Container(width: 80, color: color),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Demonstrates different MainAxisAlignment options for Row widgets.
class RowAlignmentDemo extends StatelessWidget {
  const RowAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: RowAlignmentData.examples
          .map<Widget>((RowAlignmentExample e) => RowAlignmentViewer(example: e))
          .toList(),
    );
  }
}

/// Data model for a single column alignment example.
class ColumnAlignmentExample {
  final String title;
  final MainAxisAlignment alignment;
  final List<Color> colors;

  const ColumnAlignmentExample({
    required this.title,
    required this.alignment,
    required this.colors,
  });
}

/// Data source for various column alignment examples.
class ColumnAlignmentData {
  static const List<ColumnAlignmentExample> examples = [
    ColumnAlignmentExample(
      title: 'Align boxes to the top',
      alignment: MainAxisAlignment.start,
      colors: [Colors.red, Colors.green, Colors.blue],
    ),
    ColumnAlignmentExample(
      title: 'Center all boxes',
      alignment: MainAxisAlignment.center,
      colors: [Colors.orange, Colors.purple, Colors.cyan],
    ),
    ColumnAlignmentExample(
      title: 'Align boxes to the bottom',
      alignment: MainAxisAlignment.end,
      colors: [Colors.pink, Colors.amber, Colors.teal],
    ),
    ColumnAlignmentExample(
      title: 'Space between boxes',
      alignment: MainAxisAlignment.spaceBetween,
      colors: [Colors.indigo, Colors.lime, Colors.brown],
    ),
    ColumnAlignmentExample(
      title: 'Space around each box',
      alignment: MainAxisAlignment.spaceAround,
      colors: [Colors.deepOrange, Colors.lightBlue, Colors.lightGreen],
    ),
    ColumnAlignmentExample(
      title: 'Equal space evenly',
      alignment: MainAxisAlignment.spaceEvenly,
      colors: [Colors.deepPurple, Colors.yellowAccent, Colors.blueGrey],
    ),
  ];
}

/// Displays a single column alignment example based on provided data.
class ColumnAlignmentViewer extends StatelessWidget {
  final ColumnAlignmentExample example;

  const ColumnAlignmentViewer({super.key, required this.example});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            example.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: example.alignment,
            children: example.colors
                .map<Widget>(
                  (Color color) => Container(height: 60, width: 60, color: color),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

/// Demonstrates different MainAxisAlignment options for Column widgets.
/// Now wrapped in SingleChildScrollView to prevent horizontal overflow.
class ColumnAlignmentDemo extends StatelessWidget {
  const ColumnAlignmentDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: ColumnAlignmentData.examples
              .map<Widget>((ColumnAlignmentExample e) => SizedBox(
                    width: 200, // Fixed width for each column example
                    child: ColumnAlignmentViewer(example: e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

/// A 4x4 grid of containers with dynamically generated colors.
class ColorGrid extends StatelessWidget {
  const ColorGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(4, (rowIdx) {
        return Expanded(
          child: Row(
            children: List<Widget>.generate(4, (colIdx) {
              return Expanded(
                child: Container(
                  color: Color.fromARGB(
                    255,
                    (rowIdx * 64) % 256,
                    (colIdx * 64) % 256,
                    ((rowIdx + colIdx) * 32) % 256,
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}

/// Combines ColorGrid3x3 and ColorGrid for display.
class ColorGridSection extends StatelessWidget {
  const ColorGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Basic 3x3 Grid (black borders)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 3 * 1.2, // Proportional height
            child: const ColorGrid3x3(),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Dynamic 4x4 Color Grid',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 4 * 1.2, // Proportional height
            child: const ColorGrid(),
          ),
        ],
      ),
    );
  }
}

/// Main screen showcasing different layout alignment options using tabs.
class LayoutShowcaseScreen extends StatefulWidget {
  const LayoutShowcaseScreen({super.key});

  @override
  State<LayoutShowcaseScreen> createState() => _LayoutShowcaseScreenState();
}

class _LayoutShowcaseScreenState extends State<LayoutShowcaseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Alignment Showcase'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Tab>[
            Tab(text: 'Rows', icon: Icon(Icons.line_weight)),
            Tab(text: 'Columns', icon: Icon(Icons.height)),
            Tab(text: 'Grids', icon: Icon(Icons.grid_on)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          RowAlignmentDemo(),
          ColumnAlignmentDemo(),
          ColorGridSection(),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LayoutShowcaseScreen(),
    );
  }
}