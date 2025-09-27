import 'dart:io';

void main() {
  print("Nhập mật khẩu:");
  var input = stdin.readLineSync();
  String? mk = input ?? '';
  if (mk.length < 10) {
    print("Mật khẩu quá ngắn");
  } else if (!mk.contains(RegExp(r'[A-Z]'))) {
    print("Mật khẩu phải có ít nhất một chữ in hoa");
  } else if (!mk.contains(RegExp(r'[0-9]'))) {
    print("Mật khẩu phải có ít nhất một chữ số");
  } else if (!mk.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    print("Mật khẩu phải có ít nhất một ký tự đặc biệt");
  } else {
    print("Mật khẩu hợp lệ");
  }
}
