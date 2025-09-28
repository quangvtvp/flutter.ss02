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
  var sochuso = 0;
  var i = n;
  while (i > 0) {
    i = i ~/ 10;
    sochuso += 1;
  }
  print("------------------------------");
  print("Số chữ số của $n là: $sochuso");
  print("------------------------------");
}
