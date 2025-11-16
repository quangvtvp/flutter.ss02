import 'dart:io';

void main() {
  stdout.write('\nNhập a: ');
  int? a = int.tryParse(stdin.readLineSync() ?? '');
  stdout.write('Nhập b: ');
  int? b = int.tryParse(stdin.readLineSync() ?? '');
  if (a == null || b == null || a > b) {
    print('Khoảng không hợp lệ');
  } else {
    int dem = 0;
    for (int x = a; x <= b; x++) {
      if (x < 2) continue;
      bool isPrime = true;
      for (int i = 2; i * i <= x; i++) {
        if (x % i == 0) {
          isPrime = false;
          break;
        }
      }
      if (isPrime) dem++;
    }
    print('Có $dem số nguyên tố trong khoảng [$a, $b]');
  }
}