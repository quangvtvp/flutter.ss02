import 'package:audioplayers/audioplayers.dart';
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
  int? _firstFlipcardIndex = null;
  int? _secondFlipcardIndex = null;
  AudioPlayer _flipAudio = AudioPlayer();
  AudioPlayer _matchAudio = AudioPlayer();

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
    // if card is already matched or flipped, do nothing
    if (_cards[index].isMatched || _cards[index].isFlipped) {
      return;
    }
    // if first flip card is null, set it
    if (_firstFlipcardIndex == null) {
      _firstFlipcardIndex = index;
      setState(() {
        _cards[index].isFlipped = true;
        _flipAudio.play(AssetSource('sounds/flip.mp3'));
      });
    } else if (_secondFlipcardIndex == null) {
      // if second flip card is null, set it
      _secondFlipcardIndex = index;
      setState(() {
        _cards[index].isFlipped = true;
        _flipAudio.play(AssetSource('sounds/flip.mp3'));
        // delay 2 second then check match
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            if (_cards[_firstFlipcardIndex!].emoji ==
                _cards[_secondFlipcardIndex!].emoji) {
              // if match, set both cards as matched
              _cards[_firstFlipcardIndex!].isMatched = true;
              _cards[_secondFlipcardIndex!].isMatched = true;
              _matchAudio.play(AssetSource('sounds/match.mp3'));
            } else {
              // if not match, flip both cards back
              _cards[_firstFlipcardIndex!].isFlipped = false;
              _cards[_secondFlipcardIndex!].isFlipped = false;
            }
            // reset first and second flip card index
            _firstFlipcardIndex = null;
            _secondFlipcardIndex = null;
          });
        });
      });
    }
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
                border: _cards[index].isMatched
                    ? Border.all(color: Colors.green, width: 3)
                    : null,
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    _cards[index].isFlipped ? _cards[index].emoji : "?",
                    style: const TextStyle(fontSize: 24),
                    key: ValueKey(_cards[index].isFlipped),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
