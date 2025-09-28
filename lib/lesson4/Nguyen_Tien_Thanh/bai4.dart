import 'dart:io';

void main() {
  int n;
  do {
    stdout.write('Nhập số nguyên dương n: ');
    n = int.parse(stdin.readLineSync()!);
  } while (n <= 0);

  int count = 0;
  int temp = n;
  while (temp > 0) {
    count++;
    temp ~/= 10;
  }

  print('Số chữ số của $n là $count');
}