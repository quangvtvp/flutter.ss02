import 'dart:io';

void main() {
  print('Nhập số tầng');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  while (true) {
    if (n == null || n <= 0) {
      print('Nhập sai, vui lòng nhập lại');
      n = int.tryParse(stdin.readLineSync() ?? '');
    } else {
      break;
    }
  }
  print('');
  for (int i = 1; i <= n; i++) {
    stdout.write(' ' * (n - i));
    for (int j = 1; j <= 2 * i - 1; j++) {
      if (i == n || j == 1 || j == 2 * i - 1) {
        stdout.write('*');
      } else {
        stdout.write(' ');
      }
    }
    stdout.write('\n');
  }
}