import 'dart:io';

void main() {
  print('bang cuu chuong(hang ngang)');
  for (int i = 1; i <= 10; i++) {
    for (int j = 1; j <= 10; j++) {
      stdout.write('${i}x$j=${(i * j).toString().padLeft(2)} ');
    }
    print('');
  }
}
