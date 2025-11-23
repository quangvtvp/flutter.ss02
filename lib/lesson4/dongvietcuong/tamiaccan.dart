import 'dart:io';

void main() {
  int? n;

  while (true) {
    stdout.write("Nhập n (n > 0): ");
    n = int.tryParse(stdin.readLineSync()!);

    if (n != null && n > 0) {
      break;
    } else {
      print("Bạn nhập sai rồi, hãy thử lại.");
    }
  }

  int i = 0;
  while (i < n) {
    String spaces = ' ' * (n - i - 1);
    String stars = '*' * (2 * i + 1);
    print(spaces + stars);
    i++;
  }
}