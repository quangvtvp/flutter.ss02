import 'dart:io';

void main() {
  stdout.write("Nhập cạnh n: ");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    if (i == 0 || i == n - 1) {
      // Dòng đầu và cuối
      print('*' * n);
    } else {
      // Các dòng ở giữa
      print('*' + ' ' * (n - 2) + '*');
    }
  }
}
