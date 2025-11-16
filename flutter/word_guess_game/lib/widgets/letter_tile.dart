import 'package:flutter/material.dart';

class LetterTile extends StatelessWidget {
  const LetterTile({
    super.key,
    required this.letter,
    required this.isSelected,
    required this.onTap,
  });

  final String letter;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade400 : Colors.amber.shade300,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.grey.shade600 : Colors.amber.shade700,
            width: 3,
          ),
          boxShadow: isSelected
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
        ),
        child: Center(
          child: Text(
            letter,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.grey.shade700 : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
