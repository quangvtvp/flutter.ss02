// Ví dụ 4: Tính phí vận chuyển.//
import 'dart:io';
void main() {
  print('Nhập tổng tiền (đồng): ');
  double? Money = double.tryParse(stdin.readLineSync() ?? '');
  if (Money == null || Money < 0) {
    print('Tiền không hợp lệ, thử lại.');
    return;
  }
  double gia;
  if (Money >= 500000) {
    gia = 0;
  } else if (Money >= 200000) {
    gia = 15000;
  } else {
    gia = 30000;
  }
  print('Phí vận chuyển là: ${gia.toStringAsFixed(0)} đồng');
}