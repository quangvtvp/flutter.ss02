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
  stdout.write("Số:  ");
  for (var i = 2; i <= n; i++) {
    stdout.write(" $i");
  }
  print("");
  stdout.write("Đánh:");
  for (var i = 2; i <= n; i++) {
    if (isPrime(i)) {
      if (i < 10) {
        stdout.write(" *");
      } else {
        stdout.write("  *");
      }
    } else if (i < 10) {
      stdout.write("  ");
    } else {
      stdout.write("   ");
    }
  }
}

bool isPrime(int number) {
  if (number < 2) return false;
  for (var i = 2; i < number; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}
