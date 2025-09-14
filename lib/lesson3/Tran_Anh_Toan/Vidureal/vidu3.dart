// Ví dụ 3: Kiểm tra năm nhuận.//
import 'dart:io';
void main() {
  print('Nhập năm: ');
  int? year = int.tryParse(stdin.readLineSync() ?? '');
  if (year == null || year < 0) {
    print('Năm không hợp lệ, thử lại.');
    return;
  }
  if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
    print('$year là năm nhuận.');
  } else {
    print('$year không phải là năm nhuận.');
  }
}