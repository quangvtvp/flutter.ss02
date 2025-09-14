//Tính tích các số từ 1 đến n
import 'dart:io';

void main() {
  print('Bài 1: Tính tích các số từ 1 đến n (n!)');
  print('Xin chào bạn!');
  stdout.write('Nhập vào một số nguyên dương n: ');
  int n = int.parse(stdin.readLineSync()!);
  int giaithua = 1;
  for (int i = 1; i <= n; i++) {
    giaithua *= i;
  }
  print('Tích các số từ 1 đến $n là n! = $giaithua');
}
