import 'dart:io';

void main() {
  stdout.write('Nhập số nguyên dương n: ');
  final raw = stdin.readLineSync() ?? '';
  final n = int.tryParse(raw);

  if (n == null || n <= 0) {
    print('Nhập số nguyên dương');
    return;
  }

  int u1 = 0;
  int u2 = 1;
  print('Dãy fibonaci:');
  for (int i = 1; i <= n; i++) {
    print(u1);
    int u3 = u1 + u2;
    u1 = u2;
    u2 = u3;
  }
}
