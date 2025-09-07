import 'dart:io';

void main() {
  print('Xin chào bạn!');
  print('Nhập giờ hiện tại: ');
  int? hour = int.tryParse(stdin.readLineSync() ?? '');
  if (hour == null || hour < 0 || hour > 23) {
    print('Giờ không hợp lệ, thử lại.');
    return;
  }
  if (hour < 11) {
    print('Chào buổi sáng');
  } else if (hour < 19) {
    print('Chào buổi chiều');
  } else {
    print('Chào buổi tối');
  }
}