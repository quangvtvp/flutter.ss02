import 'dart:io';

void main() {
  print('vui lòng nhập số lượng hàng của bạn :');
  int hang = int.parse(stdin.readLineSync() ?? '0');
  if (hang < 0) {
    print('số lượng không hợp lệ');
  } else if (hang == 0) {
    print('đã hết hàng');
  } else if (hang < 5) {
    print('sắp hết');
  } else {
    print('còn hàng');
  }
}
