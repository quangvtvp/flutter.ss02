// vẽ hình vuông

import 'dart:io';

void main() {
  print('nhập chiều dài cạnh hình vuông: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n <= 0) {
    print('lỗi! vui lòng nhập lại.');
    return main();
  } else {
    for (int i = 1; i <= n; i++) {
      if (i == 1 || i == n) {
        print('*' * n);
      } else {
        print('*${' ' * (n - 2)}*');
      }
    }
  }
}
