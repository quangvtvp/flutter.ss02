import 'dart:io';

void main() {
  print("Nhập mật khẩu: ");
  var input = stdin.readLineSync()?.trim() ?? "";
  if (input.length < 8) {
    print("Mật khẩu quá ngắn. Mật khẩu phải có ít nhất 8 ký tự.");
  } else {
    bool hasUppercase = input.contains(RegExp(r'[A-Z]'));
    bool hasDigit = input.contains(RegExp(r'\d'));

    if (hasUppercase && hasDigit) {
      print("Mật khẩu hợp lệ.");
    } else {
      print(
          "Mật khẩu chưa đủ mạnh. Mật khẩu phải chứa ít nhất một chữ cái viết hoa và một chữ số.");
    }
  }
}
