import 'dart:io';

void main() {
  print('Nhập mật khẩu: ');
  String password = stdin.readLineSync() ?? '';
  if (password.length < 8) {
    print('Mật khẩu quá ngắn');
    return;
  }
  bool kiemtraso = password.contains(RegExp(r'[0-9]'));
  bool kiemtrachu = password.contains(RegExp(r'[A-Z]'));
  if (kiemtraso && kiemtrachu) {
    print('Hợp lệ');
  } else {
    print('Mật khẩu chưa đủ mạnh');
  }
}
