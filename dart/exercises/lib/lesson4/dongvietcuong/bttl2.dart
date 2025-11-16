import 'dart:io';

void main() {
  int? n;
  while (true) {
    stdout.write("Nhập n (n > 0): ");
    n = int.tryParse(stdin.readLineSync()!);
    if (n != null && n > 0) break;
    print("Bạn nhập sai rồi, hãy thử lại.");
  }

  for (int i = 1; i <= n; i++) {
    // số khoảng trắng trước
    String line = ' ' * (n - i);

    if (i == 1) {
      line += '*';
    } else if (i == n) {
      line += '*' * (2 * n - 1);
    } else {
      line += '*${' ' * (2 * i - 3)}*';
    }

    print(line);
  }
}
