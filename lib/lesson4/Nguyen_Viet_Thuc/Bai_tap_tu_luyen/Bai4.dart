import 'dart:io';

void main() {
  print("Nhập số n: ");
  var input = stdin.readLineSync();
  var n = int.tryParse(input!);
  while (n == null || n < 1) {
    print("Giá trị không hợp lệ, vui lòng nhập lại: ");
    var input = stdin.readLineSync();
    n = int.tryParse(input!);
  }
  var number1 = 0;
  var number2 = 1;
  print("--------------");
  stdout.write("Dãy Fibonacci: $number1 $number2");
  while (number1 <= n) {
    var nextNumber = number1 + number2;
    if (nextNumber > n) {
      break;
    }
    stdout.write(" $nextNumber");
    number1 = number2;
    number2 = nextNumber;
  }
  print("");
  print("--------------");
}
