import 'dart:io';

void main() {
  print("nhap vao mat khau");
  String? input = stdin.readLineSync();
  String matkhau = input ?? '';
  if (matkhau.length >= 8) {
    bool hasUppercase = matkhau.contains(RegExp(r'[A-Z]'));
    bool hasDigit = matkhau.contains(RegExp(r'\d'));
    if (hasUppercase|| hasDigit) {
      print("mat khau manh");
    } else {
      print("mat khau yeu");
    }
  } else {
    print("mat khau phai co it nhat 8 ky tu");
  }
}
