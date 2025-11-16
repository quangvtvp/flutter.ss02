import 'dart:io';

void main() {
  stdout.write('Nhập số nguyên dương n: ');
  final raw = stdin.readLineSync() ?? '';
  final n = int.tryParse(raw);
  if (n == null || n < 0 ) {
    print('Vui lòng nhập số nguyên dương ');
    return;
  }

   var giaiThua = 1;
  for (var i = 2; i <= n; i++) {
    giaiThua *= i;
  }

  print('$n! = $giaiThua');
}