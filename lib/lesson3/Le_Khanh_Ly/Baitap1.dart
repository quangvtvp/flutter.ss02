import 'dart:io';

void main() {
  print("Nhập vào thời gian giờ (0-23): ");
  String? input = stdin.readLineSync();
  int hour = int.parse(input!);

  if (hour >= 0 && hour < 12) {
    print("Vui lòng nhập một số hợp lệ.");
  } else if (hour < 0 || hour > 23) {
    print("Giờ không hợp lệ. Vui lòng nhập giờ từ 0 đến 23.");
  } else if (hour < 12) {
    print("Chào buổi sáng!");
  } else if (hour >= 12 && hour < 18) {
    print("Chào buổi chiều!");
  } else if (hour >= 18 && hour < 24) {
    print("Chào buổi tối!");
  } else {
    print("Giờ không hợp lệ. Vui lòng nhập giờ từ 0 đến 23.");
  }
}
