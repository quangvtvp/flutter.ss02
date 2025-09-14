//Đủ tuổi thi bằng lái: Nhập tuổi từ bàn phím. In “Đủ điều kiện thi bằng lái” nếu tuổi ≥ 18, ngược lại in “Chưa đủ tuổi”.

import 'dart:io';

void main() {
  print('vui lòng nhập tuổi của bạn: ');
  String? input = stdin.readLineSync();
  int? age = int.tryParse(input!);
  if (age == null || age <= 0) {
    print('tuổi không hợp lệ, vui lòng nhập lại!');
    return main();
  } else if (age >= 18) {
    print('Bạn đã đủ tuổi thi bằng lái');
  } else {
    print('Bạn chưa đủ tuổi thi bằng lái');
  }
}
