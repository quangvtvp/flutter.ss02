import 'dart:io';

void main() {
  print('Hãy nhập vào 1 số nguyên lớn hơn 1:');
  int number = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  int sum = 0;
  for (int i = 0; i <= number; i++) {
    sum += i;
  }
  print('Tong cua $number số nguyên đầu tiên la: $sum');
}
