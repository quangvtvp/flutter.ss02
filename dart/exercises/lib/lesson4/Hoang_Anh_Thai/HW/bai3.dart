import 'dart:io';

void main() {
  print('Nhập số:');
  int? so;
  do {
    so = int.tryParse(stdin.readLineSync()!);
    if (so == null || so < 0) print('Nhập lại');
  } while (so == null || so < 0);
  int e = 0;
  while (so! != 0) {
    e++;
    so = (so / 10).round();
    ;
  }
  print('Số chữ số là: ${e}');
}
