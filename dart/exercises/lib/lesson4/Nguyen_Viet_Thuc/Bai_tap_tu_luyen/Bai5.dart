import 'dart:io';

void main() {
  stdout.write("Nhập số a: ");
  var input1 = stdin.readLineSync();
  var a = int.tryParse(input1!);
  while (a == null || a < 1) {
    print("Giá trị không hợp lệ, vui lòng nhập lại: ");
    var input1 = stdin.readLineSync();
    a = int.tryParse(input1!);
  }
  stdout.write("Nhập số b: ");
  var input2 = stdin.readLineSync();
  var b = int.tryParse(input2!);
  while (b == null || b <= a) {
    print("Giá trị không hợp lệ, vui lòng nhập lại: ");
    var input2 = stdin.readLineSync();
    b = int.tryParse(input2!);
  }
  print("------------------------------");
  stdout.write("Các số nguyên tố trong khoảng [$a, $b] là:");
  for (var i = a; i <= b; i++) {
    var dem = 0;
    for (var j = 1; j <= i; j++) {
      if (i % j == 0) {
        dem += 1;
      }
    }
    if (dem == 2) {
      stdout.write(" $i");
    }
  }
  print("");
  print("------------------------------");
}
