import 'dart:io';

void main() {
  print('vui lòng nhập mật khẩu của bạn :');
  var password = stdin.readLineSync() ?? '';
  final hasUppercase = password.contains(RegExp(r'[A-Z]'));
  final hasDigit = password.contains(RegExp(r'\d'));
  final hasSpecialCharacter =
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  if (password.length >= 10 &&
      hasUppercase &&
      hasDigit &&
      hasSpecialCharacter) {
    print('mật khẩu mạnh');
  } else {
    print('mật khẩu chưa đạt');
  }
}
