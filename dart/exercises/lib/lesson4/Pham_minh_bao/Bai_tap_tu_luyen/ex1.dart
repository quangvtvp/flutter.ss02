// Bảng cửu chương theo hàng ngang: In bảng 1..9 trên cùng dòng, mỗi dòng là một giá trị j (dùng canh lề).

import 'dart:io';

void main() {
  for (var i = 1; i <= 9; i++) {
    for (var j = 1; j <= 9; j++) {
      stdout.write('$i x $j = ${i * j}, ');
    }
  }
}
