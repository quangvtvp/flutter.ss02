import 'dart:io';

void main() {
  stdout.write('Nhập n: ');
  int n = int.parse(stdin.readLineSync()!);
  if (n < 0) {
    print('Giá trị không hợp lệ');
    return;
  }
  int result = 1;
  for (int i = 2; i <= n; i++) {
    result *= i;
  }

  print('$n! = $result');
}
