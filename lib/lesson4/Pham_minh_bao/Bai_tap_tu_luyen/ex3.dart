// Đếm số chữ số của n: Nhập n > 0, đếm số chữ số bằng vòng lặp chia 10.

import 'dart:io';

void main() {
  print('nhập số tự nhiên n (n>0)');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n <= 0) {
    print('vui lòng nhập lại đúng định dạng số!');
    return main();
  } else {
    var i = n, m = 0;
    while (i > 0) {
      m++;
      i = i ~/ 10;
    }
    print("số $n có: $m chữ số");
  }
}
