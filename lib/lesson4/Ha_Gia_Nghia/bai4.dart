import 'dart:io';

void main() {
  stdout.write('\nNhập n (Fibonacci ≤ n): ');
  int? fibN = int.tryParse(stdin.readLineSync() ?? '');
  if (fibN == null || fibN < 0) {
    print('n không hợp lệ');
  } else {
    int a = 0, b = 1;
    stdout.write('Các số Fibonacci ≤ $fibN: ');
    while (a <= fibN) {
      stdout.write('$a ');
      int next = a + b;
      a = b;
      b = next;
    }
    print('');
  }

}