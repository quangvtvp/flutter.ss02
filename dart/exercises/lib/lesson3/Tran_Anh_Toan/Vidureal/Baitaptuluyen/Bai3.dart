//Bài 3: Tính thuế thu nhập cá nhân..//
import 'dart:io';
void main() {
  print('Nhập thu nhập hàng tháng (đồng): ');
  double? money = double.tryParse(stdin.readLineSync() ?? '');
  if (money == null || money < 0) {
    print('Thu nhập không hợp lệ. Vui lòng nhập lại.');
    return;
  }
  double tax;
  if (money <= 11000000) {
    tax = 0;
  } else if (money <= 20000000) {
    tax = money * 0.05;
  } else if (money <= 32000000) {
    tax = money * 0.1;
  } else {
    tax = money * 0.2;
  }
  print('Thuế thu nhập cá nhân: $tax VNĐ');
}