import 'dart:io';

void main() {
  print('Nhập điểm rèn luyện của bạn:');
  double diem = double.parse(stdin.readLineSync()!);
  if (diem <= 0 || diem >= 100) {
    print('Điểm không hợp lệ');
  } else if (diem >= 90) {
    print('Xuất sắc');
  } else if (diem >= 80) {
    print('Tốt');
  } else if (diem >= 65) {
    print('Khá');
  } else if (diem >= 50) {
    print('Trung bình');
  } else {
    print('Yếu');
  }
}
