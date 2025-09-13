import 'dart:io';

void main() {
  print('Bài 6: Cảnh báo tồn kho');
  print('Xin chào bạn!');
  print('Nhập số lượng hàng tồn kho:');
  int? hangTonKho = int.tryParse(stdin.readLineSync() ?? '');
  if (hangTonKho == null || hangTonKho < 0) {
    print('Số lượng hàng tồn kho không hợp lệ. Vui lòng nhập lại.');
    return;
  } else {
    print('Số lượng hàng tồn kho: $hangTonKho');
  }
  if (hangTonKho == 0) {
    print('Cảnh báo hết hàng.');
  } else if (hangTonKho < 5) {
    print('Sắp hết hàng.');
  } else {
    print('Đủ hàng.');
  }
}
