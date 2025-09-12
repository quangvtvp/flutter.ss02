import 'dart:io';
void main() {
  print('Bài 3: Thuế thu nhập cá nhân');
  print('Xin chào bạn!');
  print('Nhập thu nhập hàng tháng (đồng): ');
  double? income = double.tryParse(stdin.readLineSync() ?? '');
  if (income == null || income < 0) {
    print('Thu nhập không hợp lệ. Vui lòng nhập lại.');
    return;
  }
  double tax;
  if (income <= 11000000) {
    tax = 0;
  } else if (income <= 20000000) {
    tax = income * 0.05;
  } else if (income <= 32000000) {
    tax = income * 0.1;
  } else {
    tax = income * 0.2;
  }
  print('Thuế thu nhập cá nhân: $tax VNĐ');
}