import 'dart:io';
void main() {
  print('Nhập giờ (0–23): ');
  int? hour = int.tryParse(stdin.readLineSync() ?? '');

  if (hour == null || hour < 0 || hour > 23) {
    print('Giờ không hợp lệ.');
    return;
  }

  if (hour <= 12) {
    print('Chào buổi sáng');
  } else if (hour <= 18) {
    print('Chào buổi chiều');
  } else {
    print('Chào buổi tối');
  }
}