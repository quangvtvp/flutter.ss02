// Bài 4: Fibonachi.//
import 'dart:io';
void main() {
  stdout.write("Nhập số nguyên dương n: ");
  int? n = int.tryParse(stdin.readLineSync()!);
  while (n == null || n <= 0) {
    stdout.write("Vui lòng nhập số nguyên dương: ");
    n = int.tryParse(stdin.readLineSync()!);
  }
  int a = 0, b = 1;
  stdout.write("Dãy Fibonacci có $n số là: ");
  for (int i = 1; i <= n; i++) {
    stdout.write("$a ");
    int un = a + b;
    a = b;
    b = un;
  }
}