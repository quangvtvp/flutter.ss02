import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MycardGame1 extends StatefulWidget {
  const MycardGame1({super.key});

  @override
  State<MycardGame1> createState() => _MycardGame1State();
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

class _MycardGame1State extends State<MycardGame1> {
  final List<String> _emojiList = ['😀', '😂', '😍', '😎'];
  List<CardModel> _cards = [];
  int? _firstFlippedIndex = null;
  int? _secondFlippedIndex = null;
  AudioPlayer _flipSoundPlayer = AudioPlayer();
  AudioPlayer _matchSoundPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    // Tạo danh sách thẻ với các emoji
    _cards = [];
    for (int i = 0; i < _emojiList.length; i++) {
      _cards.add(CardModel(id: i * 2, emoji: _emojiList[i]));
      _cards.add(CardModel(id: i * 2 + 1, emoji: _emojiList[i]));
    }
    _cards.shuffle();
  }

  void onCardTapped(int index) {
    if (_cards[index].isFlipped || _cards[index].isMatched) {
      return; // Bỏ qua nếu thẻ đã lật hoặc đã ghép
    }
    if (_firstFlippedIndex == null) {
      _firstFlippedIndex = index;
      setState(() {
        _cards[index].isFlipped = true;
        _flipSoundPlayer.play(AssetSource('sounds/flip.mp3'));
      });}
     else if (_secondFlippedIndex == null) {
      _secondFlippedIndex = index;
      setState(() {
        _cards[index].isFlipped = true;
        _flipSoundPlayer.play(AssetSource('sounds/flip.mp3'));

        //delay 1 second then check match
        Future.delayed(const Duration(seconds: 1), () {
          if (_cards[_firstFlippedIndex!].emoji ==
              _cards[_secondFlippedIndex!].emoji) {
            // Ghép thành công
            _cards[_firstFlippedIndex!].isMatched = true;
            _cards[_secondFlippedIndex!].isMatched = true;
            _matchSoundPlayer.play(AssetSource('sounds/match.mp3'));
          } else {
            // Không ghép được, lật lại thẻ
            _cards[_firstFlippedIndex!].isFlipped = false;
            _cards[_secondFlippedIndex!].isFlipped = false;
          }
          _firstFlippedIndex = null;
          _secondFlippedIndex = null;
          setState(() {});
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
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Xử lý khi người chơi chạm vào thẻ
              onCardTapped(index);
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Container(
                decoration: BoxDecoration(
                  border: _cards[index].isMatched
                      ? Border.all(color: Colors.green, width: 3)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amberAccent,
                ),
                child: Center(
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      child: Text(
                        _cards[index].isFlipped ? _cards[index].emoji : '❓',
                        style: TextStyle(fontSize: 24),
                        key: ValueKey(_cards[index].isFlipped),
                      ),
                    ),
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
