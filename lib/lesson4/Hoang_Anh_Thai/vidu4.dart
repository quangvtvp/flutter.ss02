import 'dart:io';

void main() {
  int? so = int.tryParse(stdin.readLineSync()!);
  while (so == null) {
    print('Nhập lại');
  }
  if (so % 2 == 1) {
    so = so - 1;
  }
  for (int i = 1; i <= 5; i++) {
    print(so + 2 * i);
  }
}
