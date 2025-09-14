import 'dart:io';

void main() {
  print("Nhập số hàng: ");
  int? n = int.tryParse(stdin.readLineSync()!);
  switch (n) {
    case var n when n == 0:
      print("Hết hàng");
      break;
    case var n when n! > 0 && n < 5:
      print("Sắp hết");
      break;
    case var n when n! >= 5:
      print("Đủ hàng");
      break;
    default:
      print("Nhập sai");
  }
}
