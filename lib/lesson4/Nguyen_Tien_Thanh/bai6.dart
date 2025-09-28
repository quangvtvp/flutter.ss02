import 'dart:io';

void main() {
  stdout.write('Nhập a: ');
  int a = int.parse(stdin.readLineSync()!);
  stdout.write('Nhập b: ');
  int b = int.parse(stdin.readLineSync()!);

  int count = 0;
  for (int i = a; i <= b; i++) {
    if (isPrime(i)) {
      count++;
    }
  }

  print('Có $count số nguyên tố trong khoảng [$a, $b]');
}

bool isPrime(int n) {
  if (n < 2) return false;
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) return false;
  }
  return true;
}