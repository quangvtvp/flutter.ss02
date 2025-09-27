import 'dart:io';

void main() {
  stdout.write('Nhập n!: ');
  String? giaithua = stdin.readLineSync() ?? '';
  int? n = int.tryParse(giaithua ?? '');
  if (n == null || n < 0) {
    print(' n phải số nguyên dương');
    return;
  }
  var tonggiaithua = 1;
  for (var i = 2; i <= n; i++) {
    tonggiaithua *= i;
  }
  print('$n! = $tonggiaithua');
}
