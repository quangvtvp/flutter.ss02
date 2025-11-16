import 'dart:io';

void main() {
  stdout.write('Nhập chiều cao tam giác (n): ');
  final raw = stdin.readLineSync() ?? '';
  final n = int.tryParse(raw);

  if (n == null || n <= 0) {
    print('Vui lòng nhập số nguyên dương.');
    return;
  }
  print('tam giác cân rỗng chiều dài $n dòng ');
  for (int i = 1; i <= n; i++) {
    String N = ' ' * (n - i);
    String M = '*${' ' * (2 * i - 3)}${i == 1 ? ' ' : '*'}';
    print(M + N);
  }
}
