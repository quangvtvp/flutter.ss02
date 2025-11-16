import 'dart:io';

void main() {
  print('Nhập tổng tiền (đồng): ');
  String? input = stdin.readLineSync();
  int? tien = int.tryParse(input ?? '');
  if (tien == null || tien < 0) {
    print('Vui lòng nhập một số hợp lệ.');
  } else if (tien >= 500.000) {
    print('Miễn phí vận chuyển.');
  } else if (tien >= 200.000 && tien < 500.000) {
    print('Phí vận chuyển là 15.000 đồng.');
  } else if (tien >= 0 && tien < 200.000) {
    print('Phí vận chuyển là 30.000 đồng.');
  }
}
