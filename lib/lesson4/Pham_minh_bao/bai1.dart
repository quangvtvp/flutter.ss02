// tính N giai thừa

import 'dart:io';

void main() {
  print('Nhập số nguyên dương N: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n < 0) {
    print('Vui lòng nhập lại số N');
    return main();
  } else {
    int giaithua = 1;
    for (int i = 1; i <= n; i++) {
      giaithua = giaithua * i;
    }
    print('giai thừa của $n là: $n! = $giaithua');
  }
}
