import 'dart:io';

void main() {
  print('Xin chào bạn!');
  stdout.write('Nhập giờ hiện tại: ');
  String? input = stdin.readLineSync();
  print('Bạn vừa nhập: $input'); // Dòng này để kiểm tra giá trị nhập vào
  int? hour = int.tryParse(input ?? '');
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