import 'dart:io';

void main() {
  print('Nhập mật khẩu:');
  String password = stdin.readLineSync() ?? '';
  if (password.length < 8) {
    print('Quá ngắn');
    return;
  }
  bool hasUpper = password.contains(RegExp(r'[A-Z]'));
  bool hasNumber = password.contains(RegExp(r'[0-9]'));
  if (!hasUpper || !hasNumber) {
    print('Chưa đủ mạnh');
  } else {
    print('Hợp lệ');
  }
}