import 'dart:io';

void main() {
  print('Nhập số lượng tồn kho:');
  int? qty = int.tryParse(stdin.readLineSync() ?? '');
  if (qty == null || qty < 0) {
    print('Số lượng không hợp lệ!');
    return;
  }
  if (qty == 0) {
    print('Hết hàng');
  } else if (qty < 5)
    print('Sắp hết');
  else
    print('Đủ hàng');
}
