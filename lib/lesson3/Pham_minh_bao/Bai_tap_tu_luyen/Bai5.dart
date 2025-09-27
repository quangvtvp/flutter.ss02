// Strong password: ≥10 ký tự, có số, chữ hoa, ký tự đặc biệt. In “Mạnh/Chưa đạt”.

import 'dart:io';

void main() {
  print('Nhập mật khẩu của bạn: ');
  String? matkhau = stdin.readLineSync();
  if (matkhau == null) {
    print('vui lòng nhập mật khẩu!');
    return main();
  } else if (matkhau.length < 10 ||
      RegExp(r'[0-9]').hasMatch(matkhau) == false ||
      RegExp(r'[A-Z]').hasMatch(matkhau) == false ||
      RegExp(r'[!@#$%^&*()_+<>?|]').hasMatch(matkhau) == false) {
    print('Mật khẩu chưa đạt');
    return main();
  } else {
    print('Mật khẩu mạnh');
  }
}
