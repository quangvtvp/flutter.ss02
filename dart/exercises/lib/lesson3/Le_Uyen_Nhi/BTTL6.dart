import 'dart:io';

void main() {
  print('Nhập số lượng tồn kho: ');
  String? input = stdin.readLineSync();
  int? soLuong = int.tryParse(input ?? '');

  if (soLuong == null || soLuong < 0) {
    print('Dữ liệu không hợp lệ.');
    return;
  }

  if (soLuong == 0) {
    print('Hết hàng');
  } else if (soLuong < 5) {
    print('Sắp hết');
  } else {
    print('Đủ hàng');
  }
}
