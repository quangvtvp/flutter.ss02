import 'dart:io';

void main() {
  print("Nhập số hàng:");
  var input = stdin.readLineSync();
  int? n = int.tryParse(input!);
  if (n == null || n < 0) {
    print("Không hợp lệ");
  } else if (n == 0) {
    print("Hết hàng");
  } else if (n < 5) {
    print("Sắp hết");
  } else if (n >= 5) {
    print("Đủ hàng");
  }
}
