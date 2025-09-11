import 'dart:io';

void main() {
  print('Nhập giờ hiện tại: ');
  double? hour = double.tryParse(stdin.readLineSync() ?? '');
  if (hour == null || hour < 0 || hour > 24) {
    print('Giờ không hợp lệ, thử lại.');
    return;
  }
  if (hour < 12) {
    print('Chào buổi sáng');
  } else if (hour < 18) {
    print('Chào buổi chiều');
  } else {
    print('Chào buổi tối');
  }
}