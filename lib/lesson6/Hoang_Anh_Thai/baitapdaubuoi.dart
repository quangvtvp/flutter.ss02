import 'dart:io';

//code by NotTie
void main() {
  Map<String, String> thongtin = {};
  print('Nhập các thông tin muốn thêm: (Nhập exit để thoát) ');
  while (true) {
    String? a = stdin.readLineSync()!;
    if (a == 'exit') {
      break;
    }
    String? b = stdin.readLineSync()!;
    if (b == 'exit') {
      break;
    }
    thongtin[a] = b;
  }
  print('Thông tin của bạn là: ');
  thongtin.forEach((key, value) {
    print('Sở thích của $key: $value');
  });
}
