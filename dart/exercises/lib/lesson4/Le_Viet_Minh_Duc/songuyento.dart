import 'dart:io';

void main() {
  print('Xin chào bạn!');
  print('Bài tập: In các số nguyên tố từ 1 đến n');
  stdout.write('Nhập vào một số nguyên dương n: ');
  int n = int.tryParse(stdin.readLineSync()!) ?? 0;
  while (true) {
    if (n <= 0) {
      print('Số nhập vào không hợp lệ. Vui lòng nhập số nguyên dương.');
      stdout.write('Nhập vào một số nguyên dương n: ');
      n = int.tryParse(stdin.readLineSync()!) ?? 0;
    } else {
      break;
    }
  }

  print('Các số nguyên tố từ 1 đến $n là:');
  for (int i = 2; i <= n; i++) {
    bool isPrime = true;
    for (int j = 2; j <= i ~/ 2; j++) {
      if (i % j == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      print(i);
    }
  }
  print('Chương trình kết thúc. Cảm ơn bạn đã sử dụng!');
}
