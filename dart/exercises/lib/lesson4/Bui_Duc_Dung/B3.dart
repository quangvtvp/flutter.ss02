import 'dart:io';

void main() {
  stdout.write('Nhập n > 0: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  if (n == null || n <= 0) {
    print('❌ Giá trị n không hợp lệ');
    return;
  }

  int count = 0, temp = n;
  while (temp > 0) {
    count++;
    temp ~/= 10;
  }

  print('✅ Số chữ số của $n là: $count');
}
