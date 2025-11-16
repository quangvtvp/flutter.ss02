import 'dart:io';

void main() {
  print('nhập điểm rèn luyện của bạn:');
  double diem = double.parse(stdin.readLineSync()!);
  if (diem <= 0 || diem >= 100) {
    print('điểm rèn luyện không hợp lệ');
  } else if (diem >= 90) {
    print('bạn xếp loại xuất sắc');
  } else if (diem >= 80) {
    print('bạn xếp loại giỏi');
  } else if (diem >= 65) {
    print('bạn xếp loại khá');
  } else if (diem >= 50) {
    print('bạn xếp loại trung bình');
  } else {
    print('bạn xếp loại yếu');
  }
}
