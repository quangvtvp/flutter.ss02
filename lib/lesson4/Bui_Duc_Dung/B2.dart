import 'dart:io';

void main() {
  stdout.write('Nhập chiều cao tam giác: ');
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= n; i++) {
    stdout.write(' ' * (n - i));

    for (int j = 1; j <= 2 * i - 1; j++) {
      if (j == 1 || j == 2 * i - 1 || i == n) {
        stdout.write('*');
      } else {
        stdout.write(' ');
      }
    }

    print('');
  }
}
