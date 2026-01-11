import 'package:flutter/material.dart';

/// Version 1: Basic Memory Card Game
/// - Card shuffle at start
/// - Click to flip card (one-way flip only)
/// - No match checking
/// - No processing logic
/// - No score or move counter
/// - Cards stay flipped once opened

class CardModel {
  final int id;
  final String emoji;
  bool isFlipped;

  CardModel({required this.id, required this.emoji, this.isFlipped = false});
}

class MemoryGameV1Basic extends StatefulWidget {
  const MemoryGameV1Basic({super.key});

  @override
  State<MemoryGameV1Basic> createState() => _MemoryGameV1BasicState();
}

class _MemoryGameV1BasicState extends State<MemoryGameV1Basic> {
  // List of emojis (8 pairs)
  final List<String> _emojis = ['🎯', '🌟', '🎨', '🎭', '🎪', '🎢', '🎡', '🎠'];

  // Game state
  List<CardModel> _cards = [];

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
    });
  }

  // Handle card tap - just flip the card
  void _onCardTap(int index) {
    // Skip if card is already flipped
    if (_cards[index].isFlipped) return;

    setState(() {
      _cards[index].isFlipped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Memory Game V1 - Basic'),
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
              // Info card
              _buildInfoCard(),

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

  Widget _buildInfoCard() {
    final flippedCount = _cards.where((c) => c.isFlipped).length;

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
      child: Column(
        children: [
          const Text(
            'V1: Tap to flip cards',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Flipped: $flippedCount / ${_cards.length}',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
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

    return GestureDetector(
      onTap: () => _onCardTap(index),
      child: Container(
        decoration: BoxDecoration(
          color: card.isFlipped ? Colors.white : Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.deepPurple.shade300, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            card.isFlipped ? card.emoji : '?',
            style: TextStyle(
              fontSize: 32,
              color: card.isFlipped ? null : Colors.white,
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
