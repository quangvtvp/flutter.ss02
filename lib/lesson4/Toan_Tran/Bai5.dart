//Bài 5: Đếm số nguyên tố trong khoảng [a, b].//
import 'dart:io';
void main() {
  int? a, b;
  while (a == null) {
    stdout.write("Nhập số nguyên dương a: ");
    a = int.tryParse(stdin.readLineSync() ?? "");
    if (a == null) print("Lỗi: vui lòng nhập số nguyên!");
  }
  while (b == null || b < a) {
    stdout.write("Nhập số nguyên dương b (>= $a): ");
    b = int.tryParse(stdin.readLineSync() ?? "");
    if (b == null || b < a) print("Lỗi: vui lòng nhập số nguyên >= $a!");
  }
  int count = 0;
  for (int x = a; x <= b; x++) {
    if (x < 2) continue;
    bool nt = true;
    for (int i = 2; i * i <= x; i++) {
      if (x % i == 0) { nt = false; break; }
    }
    if (nt) count++;
  }
  print("Có $count số nguyên tố trong khoảng [$a, $b]");
}
