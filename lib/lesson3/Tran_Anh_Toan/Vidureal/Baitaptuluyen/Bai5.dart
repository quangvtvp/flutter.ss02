// Ví dụ 5: Đánh giá mật khẩu.//
import 'dart:io';

void main() {
  print('Nhập mật khẩu: ');
  String? password = stdin.readLineSync();
  if (password == null || password.isEmpty) {
    print('Mật khẩu không hợp lệ, thử lại.');
    return;
  }
  if (password.length <= 10) {
    print('Mật khẩu quá ngắn');
  } else {
    final so = RegExp(r'\d').hasMatch(password);
    final chu = RegExp(r'[A-Z]').hasMatch(password);
    if (!so || !chu) {
      print('Chưa đủ mạnh, cần ít nhất 1 số hoặc 1 chữ hoa)');
    } else {
      print('Hợp lệ, mật khẩu mạnh');
    }
  }
}
