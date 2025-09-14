import 'dart:io';

void main() {
  print('Nhập tổng tiền đơn hàng:');
  int? total = int.tryParse(stdin.readLineSync() ?? '');

  if (total == null || total < 0) {
    print('Tổng tiền không hợp lệ.');
    return;
  }
  int shippingFee = 0;

  if (total >= 500000) {
    shippingFee = 0;
  } else if (total >= 200000) {
    shippingFee = 15000;
  } else {
    shippingFee = 30000;
  }
  int finalAmount = total + shippingFee;
  print('Phí vận chuyển: $shippingFee');
  print('Tổng thanh toán: $finalAmount');
}
