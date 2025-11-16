import 'dart:io';

void main() {
  print('Nhập số:');
  int? so;
  do {
    so = int.tryParse(stdin.readLineSync()!);
    if (so == null || so < 0) print('Nhập lại');
  } while (so == null || so < 0);
  int i = 1;
  int j = 1;
  int temp;
  while (i <= so && j <= so) {
    stdout.write('$j ');
    temp = i + j;
    i = j;
    j = temp;
  }
}
