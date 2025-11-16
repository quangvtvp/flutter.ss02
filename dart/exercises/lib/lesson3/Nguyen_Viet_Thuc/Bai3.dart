import 'dart:io';

void main() {
  print("Nhập số năm: ");
  var input = stdin.readLineSync();
  var year = int.tryParse(input!);
  if (year == null || year < 0) {
    print("Giá trị bạn nhập không phải là số năm hợp lệ");
  } else if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
    print("$year là năm nhuận");
  } else {
    print("$year không phải là năm nhuận");
  }
}
