import 'dart:io';

void main() {
  stdout.write('Nhập n: ');
  int n = int.parse(stdin.readLineSync()!);

  int a = 0, b = 1;
  while (a <= n) {
    stdout.write('$a ');
    int temp = a + b;
    a = b;
    b = temp;
  }
  print('');
}