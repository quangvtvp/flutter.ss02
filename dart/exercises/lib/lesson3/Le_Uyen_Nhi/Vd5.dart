import 'dart:io';

void main() {
  print('Nhập mật khẩu: ');
  String password = stdin.readLineSync()?.trim() ?? '';
  if (password.length < 8) {
    print('Quá ngắn');
  } else {
    final hasDigit = RegExp(r'\d').hasMatch(password);
    final hasUpper = RegExp(r'[A-Z]').hasMatch(password);
    if (!hasDigit || !hasUpper) {
      print('Chưa đủ mạnh (cần 1 số và 1 chữ hoa)');
    } else {
      print('Hợp lệ');
    }
  }
}
