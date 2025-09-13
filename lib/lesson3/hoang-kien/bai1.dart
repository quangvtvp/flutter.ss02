import 'dart:io';

void main() {
  print("Nhập một giờ cụ thể:");
  var input = stdin.readLineSync();
  int? gio = int.tryParse(input!);
  if (gio == null || gio < 0 || gio > 24) {
    print("Giờ không hợp lệ");
  } else if (gio < 12) {
    print("Chào buổi sáng");
  } else if (gio < 18) {
    print("Chào buổi chiều");
  } else {
    print("Chào buổi tối");
  }
}
