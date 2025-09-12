import 'dart:io';

void main() {
  print('Nhập mật khẩu: ');
  String input = stdin.readLineSync() ?? '';
  if (input.toString().length < 8) {
    print('Quá ngắn, vui lòng nhập lại.');
  } else {
    final hasDigit = RegExp(r'\d').hasMatch(input);
    final hasUpper = RegExp(r'[A-Z]').hasMatch(input);
    if (!hasDigit || !hasUpper) {
      print('Mật khẩu phải chứa ít nhất một chữ số và một chữ cái viết hoa.');
    } else {
      print('Mật khẩu hợp lệ.');
    }
  }
}
