import 'dart:io';

void main() {
  int? n;
  do {
    stdout.write('nhap so tang tam giac:');
    n = int.tryParse(stdin.readLineSync()!);
    if (n == null || n <= 1) {
      print('khong hop le, vui long nhap lai');
    }
  } while (n == null || n <= 1);
  for (var i = 1; i <= n; i++) {
    if (i == 1 || i == n) {
      print(' ' * (n - i) + '*' * (2 * i - 1));
    } else {
      print(' ' * (n - i) + '*' + ' ' * (2 * i - 3) + '*');
    }
  }
}
