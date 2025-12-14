import 'package:flutter/material.dart';
import 'resource.dart';

class Doan extends StatefulWidget {
  const Doan({super.key});

  @override
  State<Doan> createState() => _DoanState();
}

class _DoanState extends State<Doan> {
  final TextEditingController _tenController = TextEditingController();
  final TextEditingController _moTaController = TextEditingController();

  void _xuLyDoan() {
    String ten = _tenController.text.trim();
    String moTa = _moTaController.text.trim();

    if (ten.isEmpty || moTa.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập đầy đủ Tên và Mô tả!')),
      );
      return;
    }

    themKetQua(ten, moTa);

    _tenController.clear();
    _moTaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _tenController,
            decoration: const InputDecoration(
              labelText: 'Nhập Tên của bạn',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _moTaController,
            decoration: const InputDecoration(
              labelText: 'Mô tả ngắn về sở thích/tính cách',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.psychology),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _xuLyDoan,
              icon: const Icon(Icons.auto_fix_high),
              label: const Text(
                'TIÊN TRI NGHỀ NGHIỆP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF904CA3), // Màu tím đậm
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
