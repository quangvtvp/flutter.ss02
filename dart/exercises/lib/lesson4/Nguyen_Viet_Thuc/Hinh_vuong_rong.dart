import 'dart:io';

void main() {
  print("Nhập số n: ");
  var input = stdin.readLineSync();
  var n = int.tryParse(input!);
  while (n == null || n < 0) {
    print("Giá trị không hợp lệ, vui lòng nhập lại: ");
    var input = stdin.readLineSync();
    n = int.tryParse(input!);
  }
  print("--------------");
  print("*" * n);
  for (var i = 1; i <= (n - 2); i++) {
    print("*${' ' * (n - 2)}*");
  }
  print("*" * n);
  print("--------------");
}
