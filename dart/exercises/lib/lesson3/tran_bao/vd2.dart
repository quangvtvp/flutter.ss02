import 'dart:io';
void main() {
  print('xin chào bạn');
  print('vui lòng nhập độ tuổi của bạn:');
  int? age = int.tryParse(stdin.readLineSync() ?? '');
  if (age == null || age < 0 || age > 100) {
    print('vui lòng nhập đúng độ tuổi của bạn');
    return;
  }
  if (age < 18) {
    print('bạn chưa đủ tuổi');
  } else if (age >= 18) {
    print('đủ điều kiện thi bằng lái');
  }
}