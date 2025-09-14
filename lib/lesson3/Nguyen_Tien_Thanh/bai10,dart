import 'dart:io';
void main() {
  print('Nhập thu nhập (triệu):');
  double? income = double.tryParse(stdin.readLineSync() ?? '');
  if (income == null || income < 0) {
    print('Thu nhập không hợp lệ!');
    return;
  }
  double taxRate = 0;
  if (income < 11) {
    taxRate = 0;
  } else if (income <= 20) {
    taxRate = 0.05;
  } else if (income <= 32) {
    taxRate = 0.10;
  } else {
    taxRate = 0.20;
  }
  double tax = income * taxRate;
  print('Thuế phải đóng: ${tax.toStringAsFixed(2)} triệu');
}