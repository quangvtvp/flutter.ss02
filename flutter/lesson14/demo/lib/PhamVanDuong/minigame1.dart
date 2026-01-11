import 'package:flutter/material.dart';

class SelectableListScreen extends StatefulWidget {
  const SelectableListScreen({super.key});

  @override
  State<SelectableListScreen> createState() => _SelectableListScreenState();
}

class _SelectableListScreenState extends State<SelectableListScreen> {
  // Lưu các index đã được chọn
  final Set<int> _selectedItems = {};

  void _toggleItem(int index) {
    setState(() {
      if (_selectedItems.contains(index)) {
        _selectedItems.remove(index);
      } else {
        _selectedItems.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đã chọn: ${_selectedItems.length} item'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          final isSelected = _selectedItems.contains(index);

          return ListTile(
            leading: Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? Colors.teal : Colors.grey,
            ),
            title: Text('Item ${index + 1}'),
            subtitle: Text('Mô tả cho item ${index + 1}'),
            tileColor: isSelected ? Colors.teal.shade50 : null,
            onTap: () => _toggleItem(index),
          );
        },
      ),
    );
  }
}
