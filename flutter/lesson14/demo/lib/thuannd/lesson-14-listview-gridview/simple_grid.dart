import 'package:flutter/material.dart';

class SimpleGridView extends StatelessWidget {
  const SimpleGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 4 cột
        mainAxisSpacing: 8, // Khoảng cách dọc giữa các item
        crossAxisSpacing: 8, // Khoảng cách ngang giữa các item
        childAspectRatio: 1.0, // Tỷ lệ width/height của item
      ),
      itemCount: 16,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(child: Text('$index')),
        );
      },
    );
  }
}
