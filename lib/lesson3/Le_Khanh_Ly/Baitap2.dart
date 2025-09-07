import 'dart:io';

void main() {
  print('Nhập số tuổi của bạn: ');
  String? input = stdin.readLineSync();
  int? age = int.tryParse(input ?? '');

  if (age == null) {
    print('Vui lòng nhập một số hợp lệ.');
  } else if (age < 0) {
    print('Tuổi không thể là số âm.');
  } else if (age < 18) {
    print('Bạn chưa đủ tuổi để lái xe.');
  } else {
    print('Bạn đủ tuổi để lái xe.');
  }
}
