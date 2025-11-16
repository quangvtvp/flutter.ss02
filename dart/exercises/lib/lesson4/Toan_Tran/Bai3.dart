//Bài 3: Đếm số chữ số của n.//
import 'dart:io';
void main() {
  stdout.write("Nhập số nguyên dương n: ");
  int? n = int.tryParse(stdin.readLineSync()!);
  while (n == null || n <= 0) {
    stdout.write("Vui lòng nhập số nguyên dương: ");
    n = int.tryParse(stdin.readLineSync()!);
  }
  int count = 0;
  int temp = n;
  while (temp != 0) {
    temp ~/= 10;
    count++;
  }
  print("Số $n có $count chữ số.");
}