import 'dart:io';

void main() {
  print("Nhập số nguyên dương n ");
  int? n = int.tryParse(stdin.readLineSync()!);
  switch (n) {
    case var n when n == null || n <= 0:
      print("Nhập sai");
      break;
    default:
      int sum = 0;
      for (int i = 1; i <= n!; i++) {
        sum += i;
      }
      print("Tông từ 1 đến $n là: $sum");
  }
}
