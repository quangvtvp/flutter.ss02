import 'dart:io';

void main() {
  print('Nhập mật khẩu:');
  String? password = stdin.readLineSync();
  if (password == null || password.isEmpty) {
    print('Mật khẩu không được để trống');
    return;
  }
  List<String> matkhau = password.split('');
  if (matkhau.length < 8) {
    print('Mật khẩu phải có ít nhất 8 ký tự');
    return;
  }
  bool flagchu = false;
  bool flagso = false;
  for (var i in matkhau) {
    if (i.contains(RegExp(r'[A-Z]'))) {
      flagchu = true;
    }
    if (i.contains(RegExp(r'[0-9]'))) {
      flagso = true;
    }
  }
  if (flagchu && flagso) {
    print('Mật khẩu hợp lệ');
  } else {
    print('Mật khẩu phải có ít nhất một chữ cái viết hoa và một số');
  }
}
