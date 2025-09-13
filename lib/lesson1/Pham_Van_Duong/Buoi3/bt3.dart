import 'dart:io';

void main() {
  print('Nhập năm: ');
  int? year = int.tryParse(stdin.readLineSync() ?? '');
  if (year == null || year <= 0) {
    print('Năm không hợp lệ!');
    print('Vui lòng nhập lại năm');
    return;
  }
  if ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)) {
    print('Năm $year là năm nhuận');
  } else {
    print(' Năm  $year là năm không nhuận');
  }
}
