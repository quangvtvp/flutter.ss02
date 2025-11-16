import 'dart:io';

void main() {
  int so = DateTime.now().second;
  print('Nhập số từ bàn phím: ');
  int? number;
  do {
    number = int.tryParse(stdin.readLineSync()!);
    if (number == null) {
      print('Nhập lại');
      continue;
    }
    if (number < so) {
      print('Lớn hơn nữa');
    } else if (number > so) {
      print('Nhỏ hơn nữa');
    }
  } while (number != so);
  print('Chính xác');
  return;
}
