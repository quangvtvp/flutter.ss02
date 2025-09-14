import 'dart:io';

void main() {
  stdout.write('Nhập mật khẩu: ');
  String password = stdin.readLineSync()?.trim() ?? '';

  if (password.length == 0) {
    print('Mật khẩu không được để trống.');
    return;
  }

  if (password.length < 8) {
    print('Quá ngắn');
    return;
  }

  final hasDigit = RegExp(r'\d').hasMatch(password);
  final hasUpper = RegExp(r'[A-Z]').hasMatch(password);

  if (!hasDigit && !hasUpper) {
    print('Chưa đủ mạnh');
  } else {
    print('tạo tài khoản thành công');
  }
}
