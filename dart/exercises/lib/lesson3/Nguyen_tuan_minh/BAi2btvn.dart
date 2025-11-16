import 'dart:io';

void main() {
  print("Số GB dùng trong tháng:");
  var input = stdin.readLineSync();
  double? soGB = double.tryParse(input!);
  if (soGB == null || soGB < 0) {
    print("Số GB không hợp lệ");
  } else if (soGB <= 3) {
    double tien = 100000;
    print("Số tiền phải trả là $tien VND");
  } else if (soGB > 3) {
    double tien = 100000 + (soGB - 3) * 20000;
    print("Số tiền phải trả là $tien VND");
  }
}
