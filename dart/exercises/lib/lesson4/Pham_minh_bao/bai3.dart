// in bảng cửu chương từ 1 đến 9

import 'dart:io';

void main() {
  print('bạn muốn in bảng cửu chương gì?');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n <= 0 || n >= 10) {
    print('nhập số từ 1 đến 9');
    return main();
  } else {
  cuuchuong(n);
  }
}

void cuuchuong(n) {
  for (int i = 1; i <= 9; i += 1) {
    print('$n x $i = ${n * i}');
  }
  print('******************');
}
