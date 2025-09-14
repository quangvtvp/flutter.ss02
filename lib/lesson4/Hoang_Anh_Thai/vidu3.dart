import 'dart:io';

void main() {
  print('Nhập số từ bàn phím: ');
  int? number = int.tryParse(stdin.readLineSync() ?? '');
}
