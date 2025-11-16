import 'dart:io';

void main() {
  int? n;
  do {
    stdout.write('nhap so n>0:');
    n = int.tryParse(stdin.readLineSync()!);
    if (n == null || n <= 0) {
      print('khong hop le, vui long nhap lai');
    }
  } while (n == null || n <= 0);
  var sum = 0;
  for (var i = 1; i <= n; i++) {
    if (i % 10 == 0) {
      sum = sum + 1;
    }
  }
  print('cac chu so tu 1 den $n chia het cho 10 la: $sum so');
}
