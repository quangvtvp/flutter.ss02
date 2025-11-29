import 'package:flutter/material.dart';

class MyGameScreen extends StatelessWidget {
  const MyGameScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Máy đoán nghề nghiệp'),
        centerTitle: true,
        backgroundColor: const Color(0xFF7E57C2),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFB39DDB), width: 2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFB39DDB).withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nhập thông tin để tiên tri',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7E57C2),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Họ và tên',
                  hintText: 'Nhập họ và tên của bạn',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Color(0xFF7E57C2), width: 1),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Mô tả',
                  hintText: 'Nhập mô tả: siêu toán, ngủ nhiều...',
                  prefixIcon: Icon(Icons.description_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Color(0xFF7E57C2), width: 1),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý khi nhấn nút "Tiên tri", nút có chức năng dự đoán nghề nghiệp hài hước
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF7E57C2),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Tiên tri',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
        
  