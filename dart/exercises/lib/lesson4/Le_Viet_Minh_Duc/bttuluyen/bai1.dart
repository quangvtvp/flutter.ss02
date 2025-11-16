import 'dart:io';

void main() {
  print('Xin chào bạn!');
  print('In bảng cửu chương từ 1 đến 10 theo hàng ngang:\n');

  for (int i = 1; i <= 10; i++) {
    for (int j = 1; j <= 10; j++) {
      stdout.write('$j x $i = ${j * i}\t');
    }
    print('');
  }
  print('Chương trình kết thúc. Cảm ơn bạn đã sử dụng!');
}
