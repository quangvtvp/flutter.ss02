import 'package:flutter/material.dart';

class MyCardGame extends StatefulWidget {
  const MyCardGame({super.key});

  @override
  State<MyCardGame> createState() => _MyCardGameState();
}

class CardModel {
  final int id;
  final String emoji;
  bool isFlipped;
  bool isMatched;

  CardModel({
    required this.id,
    required this.emoji,
    this.isFlipped = false,
    this.isMatched = false,
  });
}

class _MyCardGameState extends State<MyCardGame> {
  final List<String> _emojis = ['🎯', '🌟', '🎨', '🎭', '🎪', '🎢', '🎡', '🎠'];
  List<CardModel> _cards = [];

  @override
  void initState() {
    for (int i = 0; i < _emojis.length; i++) {
      _cards.add(CardModel(id: i * 2, emoji: _emojis[i]));
      _cards.add(CardModel(id: i * 2 + 1, emoji: _emojis[i]));
    }
    _cards.shuffle();
    super.initState();
  }

  void onCardClicked(int index) {
    setState(() {
      _cards[index].isFlipped = !_cards[index].isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Card Game')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Handle card tap
              onCardClicked(index);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  _cards[index].isFlipped ? _cards[index].emoji : "?",
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
