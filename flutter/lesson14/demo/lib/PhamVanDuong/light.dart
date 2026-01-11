import 'package:flutter/material.dart';

class LightBulb extends StatefulWidget {
  const LightBulb({super.key});

  @override
  State<LightBulb> createState() => _LightBulbState();
}

class _LightBulbState extends State<LightBulb> {
  // State: Đèn đang bật hay tắt?
  bool _isOn = false;

  void _toggleLight() {
    setState(() {
      _isOn = !_isOn; // Đảo ngược trạng thái
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bật/Tắt Đèn')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon thay đổi màu và hình dáng dựa trên _isOn
            Icon(
              _isOn ? Icons.lightbulb : Icons.lightbulb_outline,
              size: 100,
              color: _isOn ? Colors.blue : Colors.grey,
            ),
            const SizedBox(height: 20),
            Text(
              _isOn ? 'ĐÈN ĐANG BẬT' : 'ĐÈN ĐANG TẮT',
              style: TextStyle(
                fontSize: 24,
                color: _isOn ? Colors.orange : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleLight,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isOn ? Colors.red : Colors.green,
              ),
              child: Text(_isOn ? 'Tắt đèn' : 'Bật đèn'),
            ),
          ],
        ),
      ),
    );
  }
}
