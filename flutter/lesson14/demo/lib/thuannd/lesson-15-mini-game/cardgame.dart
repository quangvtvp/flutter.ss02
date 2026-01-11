import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MemoryCardGame extends StatefulWidget {
  const MemoryCardGame({super.key});

  @override
  State<MemoryCardGame> createState() => _MemoryCardGameState();
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

class _MemoryCardGameState extends State<MemoryCardGame> {
  final List<String> _emojis = ['🎯', '🌟', '🎨', '🎭', '🎪', '🎢', '🎡', '🎠'];
  int? _firstCardIndex;
  int? _secondCardIndex;
  bool _isProcessing = false;
  List<CardModel> _cards = [];
  final _flipAudio = AudioPlayer();
  final _matchAudio = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _initCard();
  }

  @override
  void dispose() {
    _flipAudio.dispose();
    _matchAudio.dispose();
    super.dispose();
  }

  void _playFlipSound() {
    _flipAudio.play(AssetSource('sounds/flip.mp3'));
  }

  void _playMatchSound() {
    _matchAudio.play(AssetSource('sounds/match.mp3'));
  }

  void _initCard() {
    List<CardModel> cards = [];

    for (int i = 0; i < _emojis.length; i++) {
      cards.add(CardModel(id: i * 2, emoji: _emojis[i]));
      cards.add(CardModel(id: i * 2 + 1, emoji: _emojis[i]));
    }

    cards.shuffle();

    setState(() {
      _cards = cards;
    });
  }

  void _onCardTap(int index) {
    // if card is flipped or matched, do nothing
    if (_cards[index].isFlipped || _cards[index].isMatched || _isProcessing) {
      return;
    }
    _playFlipSound();
    _isProcessing = true;
    setState(() {
      // flap the card
      _cards[index].isFlipped = true;

      if (_firstCardIndex == null) {
        _firstCardIndex = index;
        _isProcessing = false;
      } else if (_secondCardIndex == null) {
        // second card flipped and check match
        _secondCardIndex = index;
        Future.delayed(const Duration(milliseconds: 1500), () {
          setState(() {
            // check match
            final firstCard = _cards[_firstCardIndex!];
            final secondCard = _cards[_secondCardIndex!];
            if (firstCard.emoji == secondCard.emoji) {
              firstCard.isMatched = true;
              secondCard.isMatched = true;
              _playMatchSound();
            } else {
              firstCard.isFlipped = false;
              secondCard.isFlipped = false;
            }
            // reset for next turn
            _firstCardIndex = null;
            _secondCardIndex = null;
            _isProcessing = false;
          });
        });

        // reset for next turn
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          // Chọn loại animation: true = Flip, false = Fade
          final useFlipAnimation = true;

          return GestureDetector(
            onTap: () => _onCardTap(index),
            child: useFlipAnimation
                ? _buildCardWithFlip(index)
                : _buildCardWithFade(index),
          );
        },
      ),
    );
  }

  // VERSION 1: Hiệu ứng FADE (mờ dần/hiện dần)
  Widget _buildCardWithFade(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          // Mặc định: fade transition (mờ dần/hiện dần)
          child: Text(
            _cards[index].isFlipped ? _cards[index].emoji : "?",
            key: ValueKey(_cards[index].isFlipped),
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // VERSION 2: Hiệu ứng FLIP (lật thẻ 3D)
  Widget _buildCardWithFlip(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          // transitionBuilder: Tùy chỉnh hiệu ứng chuyển đổi
          transitionBuilder: (Widget child, Animation<double> animation) {
            // Kết hợp Scale + Fade để tạo hiệu ứng flip đơn giản
            return ScaleTransition(
              scale: animation,
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: Text(
            _cards[index].isFlipped ? _cards[index].emoji : "?",
            key: ValueKey(_cards[index].isFlipped),
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
