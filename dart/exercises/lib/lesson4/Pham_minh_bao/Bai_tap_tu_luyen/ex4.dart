// Fibonacci ≤ n: Nhập n, in các số Fibonacci ≤ n (dùng while).

import 'dart:io';

void main() {
  print('nhập số nguyên dương n (n>1): ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n <= 1) {
    print('vui lòng nhập lại định dạng số!');
    return main();
  } else {
    stdout.write('dãy Fibonacci là: 1, 1');
    var a = 1;
    var b = 1;
    var m = 2;
    while (m <= n) {
      stdout.write(', $m');
      a = b;
      b = m;
      m = a + b;
    }
  }
}
