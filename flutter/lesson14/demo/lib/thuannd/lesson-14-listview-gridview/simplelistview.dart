import 'package:flutter/material.dart';

/// Steps to convert a StatelessWidget to StatefulWidget:
/// 1. Sử dụng lệnh "Refactor" của IDE để chuyển đổi.
/// 2. Thêm state để lưu trữ các mục đã chọn.
/// 3. Cập nhật hàm build để phản ánh trạng thái hiện tại.
/// 4. Thêm hàm để xử lý việc chọn/bỏ chọn mục.
/// 5. Gọi setState mỗi khi trạng thái thay đổi để cập nhật giao diện.

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final Set<int> _selectedItems = {};

  void _toggleCheckbox(int index) {
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
    return Center(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                _toggleCheckbox(index);
              },
              leading: Icon(
                Icons.check_circle,
                color: _selectedItems.contains(index)
                    ? Colors.teal
                    : Colors.grey,
              ),
              title: Text('Member ${index + 1}'),
              subtitle: Text('Mo Ta cho member ${index + 1}'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}
