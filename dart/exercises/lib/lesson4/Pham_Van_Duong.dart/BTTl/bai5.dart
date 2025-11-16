import 'dart:io';

void main() {
  print('Nhập số n(n>2):');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n < 2) {
    print('n không hợp lệ');
    return;
  }
  for (int i = 2; i <= n; i++) {
    bool isPrime = true;
    for (int j = 2; j * j <= i; j++) {
      if (i % j == 0) {
        isPrime = false;
        break;
      }
    }
    int count = 0;
    if (isPrime == true) {
      count++;
    }
    print('$count');
  }
}
