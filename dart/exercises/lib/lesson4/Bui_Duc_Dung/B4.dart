import 'dart:io';

void main() {
  stdout.write('Nhập n (Fibonacci ≤ n): ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  if (n == null || n < 0) {
    print('❌ Giá trị n không hợp lệ');
    return;
  }

  int a = 0, b = 1;
  stdout.write('✅ Các số Fibonacci ≤ $n: ');
  while (a <= n) {
    stdout.write('$a ');
    int next = a + b;
    a = b;
    b = next;
  }
  print('');
}
