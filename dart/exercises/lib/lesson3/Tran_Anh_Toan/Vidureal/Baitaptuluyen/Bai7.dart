// Bài 7: Mức độ ưu tiên.//
import 'dart:io';
void main() {
  print('Nhập mức độ ưu tiên (S/A/B/C): ');
  String mucDoUuTien = stdin.readLineSync()?.trim().toUpperCase() ?? '';
  switch (mucDoUuTien) {
    case 'S':
      print('Enterprise');
      print('Thời gian phản hồi cam kết: 2h');
      break;
    case 'A':
      print('Business');
      print('Thời gian phản hồi cam kết: 8h');
      break;
    case 'B':
      print('Pro');
      print('Thời gian phản hồi cam kết: 24h');
      break;
    case 'C':
      print('Free');
      print('Thời gian phản hồi cam kết: 72h');
      break;
    default:
      print('Mức độ ưu tiên không hợp lệ.');
  }
}
