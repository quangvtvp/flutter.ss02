// Ví dụ 2: Đủ tuổi thi bằng lái xe.//
import 'dart:io';
void main() {
  print('Nhập tuổi của bạn: ');
  int? age = int.tryParse(stdin.readLineSync() ?? '');
  if (age == null || age < 0) {
    print('Tuổi không hợp lệ, thử lại.');
    return;
  }
  if (age >= 18) {
    print('Bạn đủ tuổi thi bằng lái xe.');
  } else {
    print('Bạn chưa đủ tuổi thi bằng lái xe.');
  }
}