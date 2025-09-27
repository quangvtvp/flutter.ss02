import 'dart:io';

void main() {
  print('Nhập tổng tiền: ');
  double? total = double.tryParse(stdin.readLineSync() ?? '');
  if (total == null || total < 0) {
    print('Tổng tiền không hợp lệ.');
    return;
  }
  double phi;
  if (total >= 500000) {
    phi = 0;
  } else if (total >= 200000) {
    phi = 15000;
  } else {
    phi = 30000;
  }
  print('Phí vận chuyển là: $phi');
}
