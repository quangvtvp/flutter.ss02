// Kiểm tra năm nhuận: Nhập năm (dương). In “Năm nhuận” nếu chia hết cho 400 hoặc (chia hết cho 4 và không chia hết cho 100); ngược lại in “Không nhuận”.

import 'dart:io';

void main() {
  print('Vui lòng nhập năm: ');
  String? input = stdin.readLineSync();
  int? year = int.tryParse(input!);
  if (year == null || year <= 0) {
    print('Năm vừa nhập sai, vui lòng nhập lại!');
    return main();
  } else if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) {
    print('Năm $year là năm nhuận.');
  } else {
    print('Năm $year không là năm nhuận.');
  }
}
