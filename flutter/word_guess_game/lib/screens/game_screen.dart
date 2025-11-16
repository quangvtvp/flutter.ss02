import 'package:flutter/material.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Secret word
  final String secretWord = 'YELLOW';

  // Scrambled letters
  late List<String> scrambledLetters;

  // User's guess
  List<String> userGuess = [];

  // Track which letters have been tapped
  List<bool> letterTapped = [];

  // Game state
  bool isWon = false;
  bool isLost = false;
  int attempts = 0;
  final int maxAttempts = 3;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    // Scramble the letters
    scrambledLetters = secretWord.split('');
    scrambledLetters.shuffle(Random());

    // Initialize tapped state
    letterTapped = List.generate(secretWord.length, (index) => false);

    // Reset game state
    userGuess.clear();
    isWon = false;
    isLost = false;
    attempts = 0;
  }

  void _onLetterTap(int index) {
    if (letterTapped[index] || isWon || isLost) return;

    setState(() {
      letterTapped[index] = true;
      userGuess.add(scrambledLetters[index]);

      // Check if word is complete
      if (userGuess.length == secretWord.length) {
        String guessedWord = userGuess.join('');
        if (guessedWord == secretWord) {
          isWon = true;
        } else {
          attempts++;
          if (attempts >= maxAttempts) {
            isLost = true;
          } else {
            // Reset for another try
            Future.delayed(const Duration(milliseconds: 500), () {
              setState(() {
                userGuess.clear();
                letterTapped = List.generate(
                  secretWord.length,
                  (index) => false,
                );
              });
            });
          }
        }
      }
    });
  }

  void _resetGame() {
    setState(() {
      _initializeGame();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlue.shade300, Colors.lightBlue.shade100],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with back button and attempts
              _buildHeader(),

              const SizedBox(height: 40),

              // Instructions
              const Text(
                'Tap letters in order to spell:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              // User's guess display
              _buildGuessDisplay(),

              const SizedBox(height: 60),

              // Scrambled letters
              _buildScrambledLetters(),

              const SizedBox(height: 40),

              // Win/Lose message
              if (isWon) _buildWinMessage(),
              if (isLost) _buildLoseMessage(),

              const Spacer(),

              // Reset button
              if (isWon || isLost) _buildResetButton(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),

          // Attempts display
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.favorite, color: Colors.red, size: 24),
                const SizedBox(width: 8),
                Text(
                  '${maxAttempts - attempts} / $maxAttempts',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGuessDisplay() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          secretWord.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: 40,
            height: 50,
            decoration: BoxDecoration(
              color: index < userGuess.length
                  ? Colors.blue.shade200
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade400, width: 2),
            ),
            child: Center(
              child: Text(
                index < userGuess.length ? userGuess[index] : '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScrambledLetters() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: List.generate(
        scrambledLetters.length,
        (index) => GestureDetector(
          onTap: () => _onLetterTap(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: letterTapped[index]
                  ? Colors.grey.shade400
                  : Colors.amber.shade300,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: letterTapped[index]
                    ? Colors.grey.shade600
                    : Colors.amber.shade700,
                width: 3,
              ),
              boxShadow: letterTapped[index]
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            child: Center(
              child: Text(
                scrambledLetters[index],
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: letterTapped[index]
                      ? Colors.grey.shade600
                      : Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWinMessage() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.green.shade400,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(Icons.celebration, size: 50, color: Colors.white),
          const SizedBox(height: 10),
          const Text(
            '🎉 CHÍNH XÁC! 🎉',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Từ bí mật là: $secretWord',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildLoseMessage() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.red.shade400,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(Icons.error_outline, size: 50, color: Colors.white),
          const SizedBox(height: 10),
          const Text(
            'HẾT LƯỢT RỒI!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Từ đúng là: $secretWord',
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildResetButton() {
    return GestureDetector(
      onTap: _resetGame,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.refresh, size: 28),
            SizedBox(width: 12),
            Text(
              'CHƠI LẠI',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
