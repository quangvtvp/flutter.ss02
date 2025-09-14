import 'dart:io';

void main() {
  print("Nhập mật khẩu:");
  String matkhau = stdin.readLineSync() ?? '';
  bool enoughLength = matkhau.length >= 10;
  bool hasDigit = matkhau.contains(RegExp(r'\d'));
  bool hasUpper = matkhau.contains(RegExp(r'[A-Z]'));
  bool hasSpecial = matkhau.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  if (enoughLength && hasDigit && hasUpper && hasSpecial) {
    print(" Mật khẩu mạnh");
  } else {
    print("Mật khẩu chưa đạt");
  }
}
