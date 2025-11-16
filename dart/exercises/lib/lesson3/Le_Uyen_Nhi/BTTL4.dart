import 'dart:io';

void main() {
  print('Nhập hạnh kiểm (A/B/C/D): ');
  String? input = stdin.readLineSync()?.toUpperCase();

  switch (input) {
    case 'A':
      print('Tốt');
      break;
    case 'B':
      print('Khá');
      break;
    case 'C':
      print('TB');
      break;
    case 'D':
      print('Yếu');
      break;
    default:
      print('Giá trị không hợp lệ.');
  }
}
