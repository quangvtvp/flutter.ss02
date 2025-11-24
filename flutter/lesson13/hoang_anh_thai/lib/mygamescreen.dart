import 'package:flutter/material.dart';

class MyGameScreen extends StatelessWidget {
  const MyGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Game'),
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        foregroundColor: Color(0xFFFFFFFF),
      ),
      body: Column(
        children: const [
          Text('Nhập:'),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Họ và tên',
              hintText: 'tên bạn',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 238, 6, 6),
                  width: 2,
                ),
              ),
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Mô tả',
              prefixIcon: Icon(Icons.description_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 238, 6, 6),
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
