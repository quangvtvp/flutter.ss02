import 'dart:io';

void main() {
  print('Nhập năm : ');
  int? year = int.tryParse(stdin.readLineSync() ?? '');
  if (year == null || year <= 0) {
    print('vui lòng nhập đúng năm ');
    return;
  }
  if ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)) {
    print('kết quả thu về năm nhuận');
  } else {
    print('kết quả thu về năm không nhuận');
  }
}
