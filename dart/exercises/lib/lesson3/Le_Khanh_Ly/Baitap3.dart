import 'dart:io';

void main() {
  print('Nhập số năm: ');
  String? input = stdin.readLineSync();
  int year = int.tryParse(input ?? '') ?? 0;
  if (year < 0) {
    print('Năm không thể là số âm.');
  } else if (year == 0) {
    print('Năm không hợp lệ. Vui lòng nhập một năm dương lịch.');
  } else if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
    print('$year Năm nhuận.');
  } else {
    print('$year Không nhuận.');
  }
}
