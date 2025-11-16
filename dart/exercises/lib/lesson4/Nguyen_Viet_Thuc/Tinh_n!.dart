import 'dart:io';

void main() {
  print("Nhập số tự nhiên n:");
  var input = stdin.readLineSync();
  var n = int.tryParse(input!);
  while (n == null || n <= 0) {
    print("Giá trị không hợp lệ, vui lòng nhập lại: ");
    var input = stdin.readLineSync();
    n = int.tryParse(input!);
  }
  var P = 1;
  for (var i = 1; i <= n; i++) {
    P = P * i;
  }
  print("Giai thừa của n là: $P");
}
