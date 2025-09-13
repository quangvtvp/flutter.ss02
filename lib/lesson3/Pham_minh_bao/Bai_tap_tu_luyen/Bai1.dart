// Điểm rèn luyện: Nhập RL (0–100). In: Xuất sắc (≥90) / Tốt (80–89) / Khá (65–79) / TB (50–64) / Yếu (<50)

import 'dart:io';

void main() {
  print('Nhập điểm rèn luyện của bạn (0-100):');
  String? input = stdin.readLineSync();
  double? RL = double.tryParse(input!);
  if (RL == null || RL < 0 || RL > 100) {
    print('điểm sai, vui lòng nhập lại điểm từ 0 - 100');
    return main();
  } else if (RL >= 90) {
    print('Xuất sắc');
  } else if (RL >= 80) {
    print('Tốt');
  } else if (RL >= 65) {
    print('Khá');
  } else if (RL >= 50) {
    print('Trung bình');
  } else {
    print('Yếu');
  }
}
