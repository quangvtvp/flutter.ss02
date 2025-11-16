import 'dart:io';

void main() {
  print(' Nhap chieu cao cua thap sao: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n < 0) {
    print(' Chieu cao cua thap khong hop le');
    return;
  }
  for (int i = 1; i <= n; i++) {
    print(' ' * (n - i) + '*' * (2 * i - 1));
  }
}
