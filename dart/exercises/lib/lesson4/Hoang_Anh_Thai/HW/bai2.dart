import 'dart:io';

void main() {
  print('Nhập số tầng:');
  int? so;
  do {
    so = int.tryParse(stdin.readLineSync()!);
    if (so == null || so < 1 || so > 9) print('Nhập lại');
  } while (so == null || so <= 0);
  print(' ' * (so - 1) + '*');
  for (int i = so - 1; i > 1; i--) {
    print(' ' * (i - 1) + "*" + " " * (2 * so - 2 * i - 1) + '*');
  }
  print('*' * (2 * so - 1));
}
