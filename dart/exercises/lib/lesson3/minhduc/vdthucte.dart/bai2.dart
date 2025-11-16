import 'dart:io';

void main() {
  print('Bài 2: Kiểm tra tuổi thi bằng lái');
  print('Xin chào bạn!');
  print('Nhập tuổi của bạn: ');
  int? age = int.tryParse(stdin.readLineSync() ?? '');
  if (age == null || age < 0) {
    print('Tuổi không hợp lệ. Nhập lại chính xác!');
    return;
  }
  if (age >= 18) {
    print('Đủ điều kiện thi bằng lái');
  } else {
    print('Chưa đủ tuổi');
  }
}