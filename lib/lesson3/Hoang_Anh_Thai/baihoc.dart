import 'dart:io';

void main() {
  print('Hãy nhập số:');
  int? number = int.tryParse(stdin.readLineSync() ?? '');
  if (number == null) {
    print('Giá trị nhập vào không hợp lệ.');
    return;
  }
  if (number % 2 == 0) {
    print('$number là số chẵn');
  } else {
    print('$number là số lẻ');
  }
}
