// in tam giác sao

import 'dart:io';

void main() {
  print('nhập chiều cao của tam giác: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n <= 0) {
    print('vui lòng nhập đúng định dạng');
    return main();
  } else {
    print('tam giác cân có chiều cao $n.');
    for (int i = 1; i <= n; i++) {
      print(' ' * (n - i) + '*' * (2 * i - 1));
    }
  }
}
