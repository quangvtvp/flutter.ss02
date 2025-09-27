//Tính tích các số từ 1 đến n
import 'dart:io';

void main() {
  print('Bài 1: Tính tích các số từ 1 đến n (n!)');
  print('Xin chào bạn!');
  stdout.write('Nhập vào một số nguyên dương n: ');
  String? input = stdin.readLineSync();
  int n = int.tryParse(input ?? '') ?? 0;
  while (true) {
    if (n <= 0) {
      print('Số nhập vào không hợp lệ. Vui lòng nhập số nguyên dương.');
      stdout.write('Nhập vào một số nguyên dương n: ');
      input = stdin.readLineSync();
      n = int.tryParse(input ?? '') ?? 0;
    } else {
      break;
    }
  }
  int giaithua = 1;
  for (int i = 1; i <= n; i++) {
    giaithua *= i;
  }
  print('Tích các số từ 1 đến $n là n! = $giaithua');
}
