import 'dart:io';
void main() {
  print("Nhập số lượng tồn kho:");
  int? sl = int.tryParse(stdin.readLineSync() ?? '');
  if (sl == null || sl < 0) {
    print("Số lượng không hợp lệ!");
  } else if (sl == 0) {
    print("Hết hàng");
  } else if (sl < 5) {
    print("Sắp hết");
  } else {
    print("Đủ hàng");
  }
}
