import 'dart:io';

void main() {
  print('nhập số nguyên dương (1-10):');
  final raw = stdin.readLineSync() ?? '';
  final n = int.tryParse(raw);
  if (n == null||n<1||n>10) {
    print('Nhập các số nguyên dương(1-10)');
    return;
  }
  for (var i = 1; i <=10 ; i++) {
    print('$n x $i = ${n * i}');
  }
}