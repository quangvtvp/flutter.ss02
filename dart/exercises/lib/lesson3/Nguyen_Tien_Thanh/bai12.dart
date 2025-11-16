import 'dart:io';

void main() {
  print('Nhập mật khẩu:');
  String pass = stdin.readLineSync() ?? '';
  bool isStrong = pass.length >= 10 &&
                  RegExp(r'[A-Z]').hasMatch(pass) &&
                  RegExp(r'[0-9]').hasMatch(pass) &&
                  RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(pass);
  print(isStrong ? 'Mạnh' : 'Chưa đạt');
}