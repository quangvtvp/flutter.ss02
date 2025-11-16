import 'dart:io';
void main() {
  print('Nhập tuổi:');
  int? age = int.tryParse(stdin.readLineSync() ?? '');

  if (age == null || age < 0) {
    print('Tuổi không hợp lệ.');
    return;
  }

  if (age >= 18) {
    print('Đủ điều kiện thi bằng lái');
  } else {
    print('Chưa đủ tuổi');
  }
}