import 'dart:io';

void main() {
  print("Nhập thu nhập (triệu đồng):");
  double? a = double.tryParse(stdin.readLineSync() ?? "0");
  if (a != null && a >= 0) {
    if (a < 11) {
      print("Thuế thu nhập cá nhân là 0%");
    } else if (a < 20 && a >= 11) {
      print("Thuế thu nhập cá nhân là 5%");
    } else if (a < 32 && a >= 20) {
      print("Thuế thu nhập cá nhân là 10%");
    } else {
      print("Thuế thu nhập cá nhân là 20%");
    }
  } else {
    print("Vui lòng nhập số hợp lệ");
  }
}
