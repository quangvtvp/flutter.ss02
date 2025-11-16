// Cảnh báo tồn kho: Nhập số lượng; 0 → “Hết hàng”; <5 → “Sắp hết”; ≥5 → “Đủ hàng”.

import 'dart:io';

void main() {
  print('Nhâp số lượng sản phẩm trong kho: ');
  String? input = stdin.readLineSync();
  int? soluong = int.tryParse(input!);
  if (soluong == null || soluong < 0) {
    print('Số lượng không họp lệ, vui lòng nhập lại!');
    return main();
  } else if (soluong == 0) {
    print('Hết hàng');
  } else if (soluong < 5) {
    print('Sắp hết');
  } else {
    print('Đủ hàng');
  }
}
