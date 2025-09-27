import 'dart:io';

void main() {
  print('Xin chào bạn!');
  print('Chào mừng bạn đến với chương trình đếm số chữ số của n');

  int n;
  while (true) {
    stdout.write('Vui lòng nhập một số nguyên dương n: ');
    String? input = stdin.readLineSync();
    int? parsedInput = int.tryParse(input ?? '');

    if (parsedInput != null && parsedInput > 0) {
      n = parsedInput;
      break;
    } else {
      print('Số nhập vào không hợp lệ. Vui lòng nhập số nguyên dương.');
    }
  }

  int count = 0;
  int temp = n;

  while (temp > 0) {
    count++;
    temp ~/= 10;
  }

  print('Số chữ số của $n là: $count');
}

