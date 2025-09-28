// Tam giác rỗng: Tam giác cân rỗng (chỉ viền *, ruột là khoảng trắng).

import 'dart:io';

void main() {
  print('nhập số chiều cao của tam giác: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n <= 0) {
    print('vui lòng nhập lại');
    return main();
  } else {
    for (var i = 1; i <= n; i++) {
      if (i == 1) {
        print(' ' * (n - 1) + '*');
      } else if (i == n) {
        print('*' * (2*n-1));
      } else {
        print(' '*(n-i) + "*" + ' '*(2*i-3) + '*');
      }
    }
  }
}
