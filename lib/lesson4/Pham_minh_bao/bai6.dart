// In các số nguyên tố ≤ n

import 'dart:io';

void main() {
  print('nhập số nguyên dương n: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n <= 0) {
    print('vui lòng nhập lại định dạng số!');
    return main();
  } else {
    for (int a = 2; a <= n; a++) {
      stdout.write('$a \t');
    }
    print('');
    for (var i = 2; i <= n; i++) {
      bool t = true;
      if (i == 2) t = true;
      if (i > 2 && i % 2 == 0) t = false;
      for (int j = 3; j < i; j++) {
        // nên thay j chạy từ 3 đến căn bậc 2 của i
        if (i % j == 0) t = false;
        break;
      }
      if (t == true) {
        stdout.write('* \t');
      } else {
        stdout.write('  \t');
      }
    }
  }
}
