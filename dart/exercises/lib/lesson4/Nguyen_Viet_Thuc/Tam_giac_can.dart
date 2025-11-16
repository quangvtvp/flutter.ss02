import 'dart:io';

void main() {
  print("Nhập số n: ");
  var input = stdin.readLineSync();
  var n = int.tryParse(input!);
  while (n == null || n <= 0) {
    print("Giá trị không hợp lệ, vui lòng nhập lại: ");
    var input = stdin.readLineSync();
    n = int.tryParse(input!);
  }
  print("--------------");
  for (var i = 1; i <= n; i++) {
    var spaces = ' ' * (n - i);
    var stars = '*' * (2 * i - 1);
    print(spaces + stars);
  }
  print("--------------");
}
