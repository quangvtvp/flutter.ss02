// Tam giác vuông

import 'dart:io';

void main() {
  print('nhập chiều cao của tam giác: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n <= 0) {
    print('vui lòng nhập lại chiều cao!');
    return main();
  } else {
    for (var i = 1; i <= n; i += 1) {
      print('*' * i);
    }
  }
}
