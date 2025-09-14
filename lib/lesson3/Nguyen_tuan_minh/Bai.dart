import 'dart:io';

void main() {
  print("Nhập một giờ cụ thể:");
  var input = stdin.readLineSync();
  int? hour = int.tryParse(input!);
  if (hour == null || hour < 0 || hour > 24) {
    print("Giờ không hợp lệ");
  } else if (hour < 12) {
    print("Chào buổi sáng");
  } else if (hour < 18) {
    print("Chào buổi chiều");
  } else {
    print("Chào buổi tối");
  }
}
