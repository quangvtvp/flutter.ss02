import 'dart:io';

void main() {
  stdout.write('Nhập số nguyên n > 0: ');
  final raw = stdin.readLineSync() ?? '';
  final n = int.tryParse(raw);

  if (n == null || n <= 0) {
    print('Nhập số nguyên dương');
    return;
  }

  int m = 1;
  int p = 0;
  for (int i = 1; i <= 100000000 && n >= m; i++) {
    m *= 10;
    p = i;
  }

  print('Số chữ số của $n là $p');
}
