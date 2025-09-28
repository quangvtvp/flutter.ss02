import 'dart:io';

void main() {
  print('Nhap so n:');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n < 0) {
    print('n khong hop le');
    return;
  }
  print('Day so Fibonacci nho hon hoac bang $n la:');
  int a = 0, b = 1, c = 0;
  while (c <= n) {
    c = a + b;
    print(c);
    a = b;
    b = c;
  }
}
