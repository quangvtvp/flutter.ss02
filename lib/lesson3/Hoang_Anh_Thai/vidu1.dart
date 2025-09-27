import 'dart:io';

void main() {
  print('Nhập giờ');
  int? gio = int.tryParse(stdin.readLineSync()!);
  if (gio == null || gio < 0 || gio >= 24) {
    print('Giờ không hợp lệ');
    return;
  }
  String thongbao = (gio < 5)
      ? 'Chào buổi tối'
      : (gio < 12)
      ? 'Chào buổi sáng'
      : (gio < 18)
      ? 'Chào buổi chiều'
      : (gio < 24)
      ? 'Chào buổi tối'
      : 'Giờ không hợp lệ';
  print(thongbao);
}
