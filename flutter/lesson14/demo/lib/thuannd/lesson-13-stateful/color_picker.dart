import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final bool isSelectionMode;
  const ColorPicker({super.key, this.isSelectionMode = false});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  // State: Màu đang được chọn
  Color _selectedColor = Colors.blue;

  // Danh sách màu để chọn
  final List<Color> _colors = [Colors.blue, Colors.red, Colors.green, Colors.orange, Colors.purple];

  void _changeColor(Color color) {
    if (widget.isSelectionMode) {
      Navigator.pop(context, color);
    } else {
      setState(() {
        _selectedColor = color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Nền thay đổi theo màu đã chọn
      backgroundColor: _selectedColor,
      appBar: AppBar(title: const Text('Chọn Màu Nền')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Chọn một màu:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final color in _colors)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () => _changeColor(color),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: _selectedColor == color ? Border.all(color: Colors.black, width: 3) : null,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
