import 'package:flutter/material.dart';
import 'screens/game_screen.dart';

/// Lesson 2: Game Assets & Visual Elements
///
/// This demo demonstrates:
/// - Asset folder organization (images/player, images/enemies, etc.)
/// - Displaying sprites on screen
/// - Using Positioned widget for absolute positioning
/// - Container and Stack widgets for layout
void main() {
  runApp(const Lesson2AssetsDemo());
}

class Lesson2AssetsDemo extends StatelessWidget {
  const Lesson2AssetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lesson 2: Game Assets & Visual Elements',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const GameScreen(),
    );
  }
}
