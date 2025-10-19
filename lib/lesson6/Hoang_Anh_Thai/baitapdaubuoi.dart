import 'dart:io';

//code by NotTie
void main() {
  Map<String, List> thongtin = {};
  print('Nhập các thông tin muốn thêm: (Nhập exit để thoát) ');
  print('eg: Tên');
  print('    Sở thích1,Sở thích2,Sở thích3');
  while (true) {
    String? a;
    while (true) {
      a = stdin.readLineSync();
      if (a == null || a.isEmpty) {
        print('Nhập hẳn hoi');
      } else {
        break;
      }
    }
    if (a == 'exit') {
      break;
    }
    String? b;
    while (true) {
      b = stdin.readLineSync();
      if (b == null || b.isEmpty) {
        print('Nhập hẳn hoi');
      } else {
        break;
      }
    }
    if (b == 'exit') {
      break;
    }
    List c = b.split(",");
    int i = 1;
    while (thongtin.containsKey(a)) {
      a = a!;
      a = a + i.toString();
      i++;
    }
    a = a!;
    thongtin[a] = c;
  }
  print('Thông tin của bạn là: ');
  thongtin.forEach((key, value) {
    print('Sở thích của $key: $value');
  });
}
