import 'package:flutter/material.dart';

class CardGridStep2 extends StatefulWidget {
  const CardGridStep2({super.key});

  @override
  State<CardGridStep2> createState() => _CardGridStep2State();
}

class _CardGridStep2State extends State<CardGridStep2> {
  // 8 cặp emoji (16 thẻ)
  final List<String> _emojis = [
    '🎯',
    '🎯',
    '🌟',
    '🌟',
    '🎨',
    '🎨',
    '🎭',
    '🎭',
    '🎪',
    '🎪',
    '🎢',
    '🎢',
    '🎡',
    '🎡',
    '🎠',
    '🎠',
  ];

  // Lưu các thẻ đã được "lật" (dùng Set để không trùng lặp)
  final Set<int> _flippedCards = {};

  // Xử lý khi tap vào thẻ
  void _onCardTap(int index) {
    setState(() {
      if (_flippedCards.contains(index)) {
        // Nếu đã lật → úp lại
        _flippedCards.remove(index);
      } else {
        // Nếu chưa lật → lật lên
        _flippedCards.add(index);
      }
    });
  }

  // Reset tất cả thẻ về trạng thái úp
  void _resetAllCards() {
    setState(() {
      _flippedCards.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Card Grid - Step 2'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          // Nút Reset
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reset tất cả',
            onPressed: _resetAllCards,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Số thẻ đã lật
            Text(
              'Đã lật: ${_flippedCards.length} / 16 thẻ',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // Grid thẻ bài
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.0,
                ),
                itemCount: _emojis.length,
                itemBuilder: (context, index) {
                  final isFlipped = _flippedCards.contains(index);

                  return GestureDetector(
                    onTap: () => _onCardTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        // Màu thay đổi theo trạng thái
                        color: isFlipped ? Colors.white : Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.deepPurple.shade300,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(10),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          // Hiển thị emoji hoặc dấu ?
                          isFlipped ? _emojis[index] : '?',
                          style: TextStyle(
                            fontSize: 32,
                            color: isFlipped ? null : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
