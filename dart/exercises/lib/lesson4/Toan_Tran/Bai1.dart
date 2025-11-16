// Bài 1: Bảng cửu chương từ 1 đến 9.//
import 'dart:io';

void main() {
  for (int i = 1; i <= 9; i++) {
    for (int j = 1; j <= 9; j++) {
      int result = j * i;
      stdout.write('$j x $i = $result\t');
    }
    print('');
  }
}
