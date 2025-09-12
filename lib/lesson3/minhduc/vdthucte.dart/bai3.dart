import 'dart:io';

void main() {
  print('Bài 3: Kiểm tra năm nhuận');
  print('Xin chào bạn!');
  print('Nhập năm (yêu cầu nhập đúng năm > 0): ');
  int? year = int.tryParse(stdin.readLineSync() ?? '');
  if (year == null || year <= 0) {
    print('Năm không hợp lệ. Vui lòng nhập lại.');
    return;
  }
  if ((year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)) {
    print('Năm nhuận');
  } else {
    print('Không nhuận');
  }
}