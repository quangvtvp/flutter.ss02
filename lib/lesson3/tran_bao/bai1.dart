import 'dart:io';
void main() {
  print('Xin chào bạn');
  print('Bây giờ là mấy giờ rồi:');
  int? hour = int.tryParse(stdin.readLineSync() ?? '');
  if (hour == null || hour < 0 || hour > 23) {
    print('Vui lòng nhập số(0-23).');
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