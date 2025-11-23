import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter + Flame Game',
      home: Scaffold(
        appBar: AppBar(title: const Text('Game Demo')),
        body: const GameScreen(),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final MyGame _game = MyGame();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: GameWidget(game: _game)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              _game.increaseSpeed();
            },
            child: const Text('Tăng tốc độ di chuyển'),
          ),
        ),
      ],
    );
  }
}

class MyGame extends FlameGame {
  double x = 0;
  double speed = 100;

  @override
  void update(double dt) {
    x += speed * dt;
    if (x > size.x) x = 0;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(Offset(x, 200), 20, Paint()..color = Colors.blue);
  }

  void increaseSpeed() {
    speed += 50;
  }
}
