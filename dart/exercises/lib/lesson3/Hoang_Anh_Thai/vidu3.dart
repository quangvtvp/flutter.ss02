import 'dart:io';

void main() {
  print("Nhập năm:");
  int? year = int.tryParse(stdin.readLineSync()!);
  if (year == null) {
    print("Năm không hợp lệ");
    return;
  }
  if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
    print("$year là năm nhuận");
  } else {
    print("$year không phải là năm nhuận");
  }
}
