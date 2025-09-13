import 'dart:io';

void main() {
  print("Nhập số giờ: ");
  var input = stdin.readLineSync();
  var Gio = int.tryParse(input!);
  if (Gio == null) {
    print("Giá trị bạn nhập không phải là số");
  } else if (Gio < 0 || Gio > 23) {
    print("Số giờ không hợp lệ");
  } else if (Gio <= 12) {
    print("Chào buổi sáng");
  } else if (Gio > 12 && Gio <= 18) {
    print("Chào buổi chiều");
  } else {
    print("Chào buổi tối");
  }
}
