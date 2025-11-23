import 'dart:io';

void main() {
  print('Nhập số:');
  int? so;
  do {
    so = int.tryParse(stdin.readLineSync()!);
    if (so == null || so < 1 || so > 9) print('Nhập lại');
  } while (so == null || so < 1 || so > 9);
  print('***Bảng cửu chương $so***');
  for (int i = 1; i <= 9; i++) {
    print('      $i x $so = ${so * i}');
  }
  print('***********************');
}
