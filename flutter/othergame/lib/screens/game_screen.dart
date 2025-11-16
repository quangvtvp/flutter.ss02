import 'package:flutter/material.dart';
import '../widgets/sprite_widget.dart';

/// Game Screen - Demonstrates Lesson 2 Concepts
///
/// Key Learning Points:
/// 1. Using Stack for layering game elements
/// 2. Positioned widget for absolute positioning
/// 3. Container for styling and layout
/// 4. Displaying multiple sprites (player, enemies, items)
/// 5. Proper asset organization
class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for positioning calculations
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFAED6F1), // Light blue sky
      body: SafeArea(
        child: Column(
          children: [
            // Header with lesson title
            _buildHeader(),

            // Game area with sprites
            Expanded(
              child: Stack(
                children: [
                  // Background
                  _buildBackground(screenSize),

                  // Player sprite (center-bottom)
                  _buildPlayerSprite(screenSize),

                  // Enemy sprites (top area)
                  _buildEnemySprites(screenSize),

                  // Collectible items (scattered)
                  _buildCollectibleItems(screenSize),

                  // Legend/Labels
                  _buildLegend(screenSize),
                ],
              ),
            ),

            // Footer with instructions
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  /// Build header section
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      color: Colors.blue.shade700,
      child: const Column(
        children: [
          Text(
            'Lesson 2: Game Assets & Visual Elements',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Sprite Rendering & Positioning Demo',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  /// Build background layer
  Widget _buildBackground(Size screenSize) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFFAED6F1), const Color(0xFF85C1E2)],
          ),
        ),
      ),
    );
  }

  /// Build player sprite at center-bottom
  Widget _buildPlayerSprite(Size screenSize) {
    return Positioned(
      left: screenSize.width / 2 - 32, // Center horizontally (sprite is 64px)
      bottom: 100,
      child: Column(
        children: [
          SpriteWidget(
            label: 'PLAYER',
            color: Color(0xFF3498DB), // Blue
            width: 64,
            height: 64,
          ),
          SizedBox(height: 4),
          Text(
            'Player',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build enemy sprites at top
  Widget _buildEnemySprites(Size screenSize) {
    return Stack(
      children: [
        // Enemy 1 - Left
        Positioned(
          left: 40,
          top: 60,
          child: Column(
            children: [
              SpriteWidget(
                label: 'ENEMY 1',
                color: Color(0xFFE74C3C), // Red
                width: 64,
                height: 64,
              ),
              SizedBox(height: 4),
              Text(
                'Enemy 1',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Enemy 2 - Right
        Positioned(
          right: 40,
          top: 60,
          child: Column(
            children: [
              SpriteWidget(
                label: 'ENEMY 2',
                color: Color(0xFFC0392B), // Darker red
                width: 64,
                height: 64,
              ),
              SizedBox(height: 4),
              Text(
                'Enemy 2',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Build collectible item sprites
  Widget _buildCollectibleItems(Size screenSize) {
    return Stack(
      children: [
        // Coin - Left middle
        Positioned(
          left: 80,
          top: screenSize.height * 0.35,
          child: Column(
            children: [
              SpriteWidget(
                label: 'COIN',
                color: Color(0xFFF1C40F), // Yellow
                width: 48,
                height: 48,
              ),
              SizedBox(height: 4),
              Text(
                'Coin',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Gem - Center middle
        Positioned(
          left: screenSize.width / 2 - 24,
          top: screenSize.height * 0.25,
          child: Column(
            children: [
              SpriteWidget(
                label: 'GEM',
                color: Color(0xFF2ECC71), // Green
                width: 48,
                height: 48,
              ),
              SizedBox(height: 4),
              Text(
                'Gem',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Star - Right middle
        Positioned(
          right: 80,
          top: screenSize.height * 0.35,
          child: Column(
            children: [
              SpriteWidget(
                label: 'STAR',
                color: Color(0xFF9B59B6), // Purple
                width: 48,
                height: 48,
              ),
              SizedBox(height: 4),
              Text(
                'Star',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Build legend showing asset folder structure
  Widget _buildLegend(Size screenSize) {
    return Positioned(
      left: 8,
      bottom: 8,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white24),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Asset Organization:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '📁 assets/images/player/',
              style: TextStyle(color: Colors.blue, fontSize: 10),
            ),
            Text(
              '📁 assets/images/enemies/',
              style: TextStyle(color: Colors.red, fontSize: 10),
            ),
            Text(
              '📁 assets/images/items/',
              style: TextStyle(color: Colors.yellow, fontSize: 10),
            ),
            Text(
              '📁 assets/images/background/',
              style: TextStyle(color: Colors.cyan, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  /// Build footer with instructions
  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.blue.shade700,
      child: const Column(
        children: [
          Text(
            'Key Concepts Demonstrated:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '• Stack & Positioned widgets for layering and positioning',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          Text(
            '• Container for styling game elements',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          Text(
            '• Organized asset folder structure by category',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
