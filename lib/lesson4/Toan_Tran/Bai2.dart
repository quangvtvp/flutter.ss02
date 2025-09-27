//Bài 2: Tam giác cân rỗng.//
import 'dart:io';
void main() {
  stdout.write("Nhập số hàng của tam giác: ");
  int? n = int.tryParse(stdin.readLineSync()!);
  while (n == null || n <= 0) {
    stdout.write("Vui lòng nhập số nguyên dương: ");
    n = int.tryParse(stdin.readLineSync()!);
  }
  print("\n--- Tam giác cân ---");
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n - i; j++) {
      stdout.write(" ");
    }
    for (int k = 1; k <= 2 * i - 1; k++) {
      stdout.write("*");
    }
    print("");
  }
}
