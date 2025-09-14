import 'dart:io';

void main() {
  stdout.write("Nhập số N: ");
  int n = int.parse(stdin.readLineSync()!);
  int number = 1;
  for (int i = 1; i <= n; i++) {
    number *= i;
  }
  print("Giai thừa: $number");
}
