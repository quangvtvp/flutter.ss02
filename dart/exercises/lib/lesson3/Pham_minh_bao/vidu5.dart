// Đánh giá mật khẩu: Nhập mật khẩu. Nếu độ dài < 8 → “Quá ngắn”. Nếu không có ít nhất 1 số hoặc 1 chữ hoa → “Chưa đủ mạnh”. Ngược lại → “Hợp lệ”.

import 'dart:io';

void main() {
  print('vui lòng nhập mật khẩu: ');
  String? mk = stdin.readLineSync();
  if (mk == null) {
    print('bạn chưa nhập mật khẩu, hãy nhập lại!');
    return main();
  } else if (mk.length < 8) {
    print('mật khẩu quá ngắn, hãy sửa lại!');
    return main();
  } else if (RegExp(r'[0-9]').hasMatch(mk) == false || RegExp(r'[A-Z]').hasMatch(mk) == false) {
    print('mật khẩu chưa đủ mạnh, hãy sửa lại!');
    return main();
  } else {
    print('mật khẩu hợp lệ');
  }
}
