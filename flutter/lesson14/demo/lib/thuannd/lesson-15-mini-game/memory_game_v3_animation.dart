import 'package:flutter/material.dart';

/// Version 3: Memory Card Game with Animation
/// - All features from V2
/// - AnimatedContainer for smooth transitions
/// - AnimatedScale for matched cards
/// - AnimatedSwitcher for emoji/question mark switch
/// - Enhanced visual feedback

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

class MemoryGameV3Animation extends StatefulWidget {
  const MemoryGameV3Animation({super.key});

  @override
  State<MemoryGameV3Animation> createState() => _MemoryGameV3AnimationState();
}

class _MemoryGameV3AnimationState extends State<MemoryGameV3Animation> {
  // List of emojis (8 pairs)
  final List<String> _emojis = ['🎯', '🌟', '🎨', '🎭', '🎪', '🎢', '🎡', '🎠'];

  // Game state
  List<CardModel> _cards = [];
  int? _firstCardIndex;
  int? _secondCardIndex;
  int _moves = 0;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  // Initialize new game
  void _initializeGame() {
    List<CardModel> cards = [];

    // Create 16 cards (each emoji appears twice)
    for (int i = 0; i < _emojis.length; i++) {
      cards.add(CardModel(id: i * 2, emoji: _emojis[i]));
      cards.add(CardModel(id: i * 2 + 1, emoji: _emojis[i]));
    }

    // Shuffle the cards
    cards.shuffle();

    setState(() {
      _cards = cards;
      _firstCardIndex = null;
      _secondCardIndex = null;
      _moves = 0;
      _isProcessing = false;
    });
  }

  // Handle card tap
  void _onCardTap(int index) {
    // Skip if processing
    if (_isProcessing) return;
    // Skip if card is already flipped
    if (_cards[index].isFlipped) return;
    // Skip if card is already matched
    if (_cards[index].isMatched) return;

    setState(() {
      // Flip the card
      _cards[index].isFlipped = true;

      if (_firstCardIndex == null) {
        // This is the first card
        _firstCardIndex = index;
      } else {
        // This is the second card
        _secondCardIndex = index;
        _moves++;
        _isProcessing = true;

        // Check match after delay
        _checkMatch();
      }
    });
  }

  // Check if two cards match
  void _checkMatch() {
    final firstCard = _cards[_firstCardIndex!];
    final secondCard = _cards[_secondCardIndex!];

    // Delay 800ms so player can see both cards
    Future.delayed(const Duration(milliseconds: 800), () {
      // Check if widget is still mounted
      if (!mounted) return;

      setState(() {
        if (firstCard.emoji == secondCard.emoji) {
          // MATCHED! Mark both cards
          firstCard.isMatched = true;
          secondCard.isMatched = true;
        } else {
          // Not matched, flip back
          firstCard.isFlipped = false;
          secondCard.isFlipped = false;
        }

        // Reset state
        _firstCardIndex = null;
        _secondCardIndex = null;
        _isProcessing = false;

        // Check win
        _checkWin();
      });
    });
  }

  // Check if player has won
  void _checkWin() {
    final allMatched = _cards.every((card) => card.isMatched);

    if (allMatched) {
      // Show win dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('🎉 Chúc mừng!', textAlign: TextAlign.center),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🏆', style: TextStyle(fontSize: 60)),
              const SizedBox(height: 16),
              Text(
                'Hoàn thành trong $_moves lượt!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                _getPerformanceMessage(),
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ],
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _initializeGame();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Chơi lại'),
              ),
            ),
          ],
        ),
      );
    }
  }

  String _getPerformanceMessage() {
    if (_moves <= 10) return '🌟 Xuất sắc! Trí nhớ siêu phàm!';
    if (_moves <= 15) return '👏 Tuyệt vời! Bạn rất giỏi!';
    if (_moves <= 20) return '👍 Khá tốt! Tiếp tục cố gắng!';
    return '💪 Cố gắng lên! Lần sau sẽ tốt hơn!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Memory Game V3 - Animation'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Score board
              _buildScoreBoard(),

              const SizedBox(height: 24),

              // Grid of cards
              Expanded(child: _buildCardGrid()),

              const SizedBox(height: 24),

              // Restart button
              _buildRestartButton(),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreBoard() {
    final matchedPairs = _cards.where((c) => c.isMatched).length ~/ 2;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Icon(Icons.touch_app, color: Colors.deepPurple, size: 28),
              const SizedBox(height: 4),
              Text(
                '$_moves',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const Text('Lượt', style: TextStyle(color: Colors.grey)),
            ],
          ),
          Container(width: 1, height: 50, color: Colors.grey.shade300),
          Column(
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 28),
              const SizedBox(height: 4),
              Text(
                '$matchedPairs / 8',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const Text('Cặp', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardGrid() {
    return Center(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.0,
          ),
          itemCount: _cards.length,
          itemBuilder: (context, index) => _buildCard(index),
        ),
      ),
    );
  }

  Widget _buildCard(int index) {
    final card = _cards[index];
    final isVisible = card.isFlipped || card.isMatched;

    return GestureDetector(
      onTap: () => _onCardTap(index),
      // AnimatedScale: Scale up when matched
      child: AnimatedScale(
        scale: card.isMatched ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        // AnimatedContainer: Animate color, border, shadow changes
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: card.isMatched
                ? Colors.green.shade100
                : isVisible
                ? Colors.white
                : Colors.deepPurple,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: card.isMatched ? Colors.green : Colors.deepPurple.shade300,
              width: card.isMatched ? 3 : 2,
            ),
            boxShadow: [
              BoxShadow(
                color: (card.isMatched ? Colors.green : Colors.deepPurple)
                    .withOpacity(isVisible ? 0.3 : 0.1),
                blurRadius: isVisible ? 8 : 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            // AnimatedSwitcher: Animate between ? and emoji
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                isVisible ? card.emoji : '?',
                // Key helps Flutter know when to animate
                key: ValueKey(isVisible),
                style: TextStyle(
                  fontSize: isVisible ? 36 : 32,
                  color: isVisible ? null : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRestartButton() {
    return ElevatedButton.icon(
      onPressed: _initializeGame,
      icon: const Icon(Icons.refresh),
      label: const Text('Chơi lại'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
