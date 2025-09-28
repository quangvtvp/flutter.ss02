import 'dart:io';

void main() {
  int? a;
  int? b;
  var sum = 0;
  do {
    print('nhap so dau trong khoang:');
    a = int.tryParse(stdin.readLineSync()!);
    if (a == null) {
      print('khong hop le, vui long nhap lai');
    }
  } while (a == null);
  do {
    print('nhap so cuoi cua khoang:');
    b = int.tryParse(stdin.readLineSync()!);
    if (b == null || b < a) {
      print('khong hop le, vui long nhap lai');
    }
  } while (b == null || b < a);

  for (var n = a; n <= b; n++) {
    var x = 0;
    if (n < 2) {
      x = 1;
    } else {
      for (var i = 2; i < n; i++) {
        if (n % i == 0) {
          x = 1;
        }
      }
    }
    if (x == 0) {
      sum = sum + 1;
    }
  }
  print('co $sum so nguyen to trong khoang [$a;$b]');
}
