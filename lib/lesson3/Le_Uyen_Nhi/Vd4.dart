import 'dart:io';

void main() {
  print('Nhập tổng tiền (đ): ');
  double? total = double.tryParse(stdin.readLineSync() ?? '');
  if (total == null || total < 0) {
    print('Tổng tiền không hợp lệ.');
    return;
  }
  double fee;
  if (total >= 500000) {
    fee = 0;
  } else if (total >= 200000) {
    fee = 15000;
  } else {
    fee = 30000;
  }
  print('Phí vận chuyển: ${fee.toStringAsFixed(0)} đ');
}
