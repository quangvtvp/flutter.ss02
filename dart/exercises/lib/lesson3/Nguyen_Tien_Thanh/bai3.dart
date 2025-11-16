import 'dart:io';
void main() {
  print('Nhập năm:');
  int? year = int.tryParse(stdin.readLineSync() ?? '');

  if (year == null || year <= 0) {
    print('Năm không hợp lệ.');
    return;
  }

  if ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)) {
    print('Năm nhuận');
  } else {
    print('Không nhuận');
  }
}