import 'dart:io';

void main() {
  stdout.write('Nhập sô nguyên dương n:');
  int? n = int.tryParse(stdin.readLineSync()!);
  int kq = 1;
  switch (n) {
    case var n when n == null || n <= 0:
      print("Nhập sai");
      break;
    default:
      for (int i = 1; i <= n!; i++) {
        kq = kq * i;
      }
      print("Giai thừa của $n là: $kq");
  }
}
