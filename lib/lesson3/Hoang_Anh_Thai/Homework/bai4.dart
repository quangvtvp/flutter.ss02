import 'dart:io';

void main() {
  print('Nhập điểm:');
  String? diem = stdin.readLineSync()!;
  switch (diem) {
    case var d when d == 'A':
      print('Tốt');
      break;
    case var d when d == 'B':
      print('Khá');
      break;
    case var d when d == 'C':
      print('Trung bình');
      break;
    case var d when d == 'D':
      print('Yếu');
      break;
    default:
  }
}
