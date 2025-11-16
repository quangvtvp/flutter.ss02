import 'dart:io';

void main() {
  print('Nhập tuổi của bạn : ');
  int? age = int.tryParse(stdin.readLineSync() ?? '');
  if (age == null || age < 0 || age > 120) {
    print('Tuổi không hợp lệ.');
    print(' vui lòng nhập lại ');
    return;
  }
  if (age >= 18) {
    print('Đủ điều kiện thi bằng lái');
  } else {
    print('Chưa đủ tuổi thi bằng lái');
  }
}
