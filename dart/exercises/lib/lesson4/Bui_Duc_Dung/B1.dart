import 'dart:io';

void main() {
  print('Bảng cửu chương (hàng ngang)');
  for (int i = 1; i <= 9; i++) {
    for (int j = 1; j <= 10; j++) {
      stdout.write('$i x $j = ${i * j}\t');
    }
    print('');
  }
}
