import 'dart:io';

void main() {
  print('Nhập mật khẩu: ');
  String? password = stdin.readLineSync();

  if (password == null) {
    print('Chưa nhập mật khẩu');
    return;
  }

  bool hasUpper = password.contains(RegExp(r'[A-Z]'));
  bool hasDigit = password.contains(RegExp(r'[0-9]'));
  bool hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool longEnough = password.length >= 10;

  if (hasUpper && hasDigit && hasSpecial && longEnough) {
    print('Mạnh');
  } else {
    print('Chưa đạt');
  }
}
