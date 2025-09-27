// Hạnh kiểm (switch): Nhập A/B/C/D → In “Tốt/Khá/TB/Yếu”.

import 'dart:io';

void main() {
  print('Nhập hạnh kiểm của bạn (A, B, C, D): ');
  String? hanhkiem = stdin.readLineSync();
  switch (hanhkiem) {
    case 'A':
      print('Hạnh kiểm của bạn là: Tốt');
      break;
    case 'B':
      print('Hạnh kiểm của bạn là: Khá');
      break;
    case 'C':
      print('Hạnh kiểm của bạn là: Trung bình');
      break;
    case 'D':
      print('Hạnh kiểm của bạn là: Yếu');
      break;
    default:
      print('Vui lòng nhập lại, hạnh kiểm không hợp lệ!');
      return main();
  }
}