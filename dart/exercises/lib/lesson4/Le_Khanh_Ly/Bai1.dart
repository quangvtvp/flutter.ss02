import 'dart:io';

void main() {
  print('Nhập số tầng của tháp sao:');
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
    stdout.write(" " * (n - i) + '*' * (2 * i - 1) + '\n');
  }
}
