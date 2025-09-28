import 'dart:io';

void main() {
  stdout.write('\nNhập n > 0: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');
  if (n == null || n <= 0) {
    print('n không hợp lệ');
  } else {
    int count = 0, temp = n;
    while (temp > 0) {
      count++;
      temp ~/= 10;
    }
    print('Số chữ số của $n là: $count');
  }

}