// Đếm số nguyên tố trong khoảng [a, b]: Chỉ dùng main, lặp x=a..b và kiểm tra như phần C.

import 'dart:io';

void main() {
  print('nhập số hạng đầu a của khoảng [a; b]');
  int? a = int.tryParse(stdin.readLineSync() ?? '');
  print('nhập số hạng cuối b của khoảng [a; b]');
  int? b = int.tryParse(stdin.readLineSync() ?? '');
  if (a == null || b == null || a < 0 || a >= b) {
    print('vui lòng nhập lại đúng định dạng số (0 ≤ a < b)');
    return main();
  } else {
    int m = 0;
    for (var i = a; i <= b; i++) {
      bool t = true;
      if (i <= 1) t = false;
      if (i == 2) t = true;
      if (i > 2 && i % 2 == 0) t = false;
      for (var j = 3; j < i; j++) {
        if (i % j == 0) {
          t = false;
          break;
        }
      }
      if (t == true) m = m + 1;
    }
    print ('từ $a đến $b có $m số nguyên tố');
  }
}
