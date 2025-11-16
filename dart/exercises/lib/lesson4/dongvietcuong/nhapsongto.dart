import 'dart:io';

bool isPrime(int x) {
  if (x < 2) return false;
  for (int i = 2; i * i <= x; i++) {
    if (x % i == 0) return false;
  }
  return true;
}

void main() {
  int? n;

  while (true) {
    stdout.write("Nhập n (n >= 2): ");
    n = int.tryParse(stdin.readLineSync()!);

    if (n != null && n >= 2) {
      break;
    } else {
      print("Bạn nhập sai rồi, hãy thử lại.");
    }
  }

  stdout.write("Số:   ");
  for (int i = 2; i <= n!; i++) {
    stdout.write("$i ");
  }
  print("");

  stdout.write("Đánh: ");
  for (int i = 2; i <= n; i++) {
    if (isPrime(i)) {
      stdout.write("* ");
    } else {
      stdout.write("  ");
    }
  }
  print("");
}
