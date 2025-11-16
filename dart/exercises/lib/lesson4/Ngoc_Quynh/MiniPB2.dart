import 'dart:io';

void main() {
  print('Vui long nhap chieu cao tam giac: ');
  int? n = int.tryParse(stdin.readLineSync()!);
  if (n == null || n <= 0) {
    print(' Chieu cao tam giac khong hop le');
    return;
  }
  for (int i = 1; i <= n; i++) {
    print('*' * i);
  }
}
