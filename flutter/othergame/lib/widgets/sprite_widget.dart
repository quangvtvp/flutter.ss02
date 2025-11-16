import 'package:flutter/material.dart';

/// SpriteWidget - A simple widget to represent game sprites
///
/// This demonstrates how to display sprites in a game.
/// In a real game, you would use Image.asset() to load actual image files.
/// For this demo, we're using CustomPaint to draw colored rectangles.
///
/// Key Concepts:
/// - CustomPaint for drawing graphics
/// - CustomPainter for custom rendering
/// - Creating reusable sprite components
class SpriteWidget extends StatelessWidget {
  final String label;
  final Color color;
  final double width;
  final double height;

  const SpriteWidget({
    super.key,
    required this.label,
    required this.color,
    this.width = 64,
    this.height = 64,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: SpritePainter(color: color, label: label),
    );
  }
}

/// Custom painter to draw the sprite
class SpritePainter extends CustomPainter {
  final Color color;
  final String label;

  SpritePainter({required this.color, required this.label});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw filled rectangle for sprite body
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    // Draw border
    final borderPaint = Paint()
      ..color = _darkenColor(color)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawRect(rect, borderPaint);

    // Draw label text
    final textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 2),
          ],
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    // Center the text
    final textX = (size.width - textPainter.width) / 2;
    final textY = (size.height - textPainter.height) / 2;

    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  /// Helper method to darken a color for borders
  Color _darkenColor(Color color) {
    return Color.fromARGB(
      ((color.a * 255.0).round() & 0xff),
      ((color.r * 255.0 * 0.7).round() & 0xff),
      ((color.g * 255.0 * 0.7).round() & 0xff),
      ((color.b * 255.0 * 0.7).round() & 0xff),
    );
  }
}

/// Alternative approach using Image.asset (commented out for reference)
/// 
/// In a real game with actual image files, you would use:
/// 
/// class SpriteWidget extends StatelessWidget {
///   final String assetPath;
///   final double width;
///   final double height;
///
///   const SpriteWidget({
///     super.key,
///     required this.assetPath,
///     this.width = 64,
///     this.height = 64,
///   });
///
///   @override
///   Widget build(BuildContext context) {
///     return Image.asset(
///       assetPath,
///       width: width,
///       height: height,
///       fit: BoxFit.contain,
///     );
///   }
/// }
/// 
/// Usage example:
/// SpriteWidget(
///   assetPath: 'assets/images/player/player.png',
///   width: 64,
///   height: 64,
/// )
