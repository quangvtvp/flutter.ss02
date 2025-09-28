import 'dart:io';

//code by NotTie
void main() {
  Map<String, List> thongtin = {};
  print('Nhập các thông tin muốn thêm: (Nhập exit để thoát) ');
  print('eg: Tên');
  print('    Sở thích1,Sở thích2,Sở thích3');
  while (true) {
    String? a = stdin.readLineSync()!;
    if (a == 'exit') {
      break;
    }
    String? b = stdin.readLineSync()!;
    if (b == 'exit') {
      break;
    }
    List c = b.split(",");
    thongtin[a] = c;
  }
  print('Thông tin của bạn là: ');
  thongtin.forEach((key, value) {
    print('Sở thích của $key: $value');
  });
}
