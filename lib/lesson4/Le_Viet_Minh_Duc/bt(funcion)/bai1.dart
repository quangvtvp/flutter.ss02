import 'dart:math';
import 'dart:io';
void main () {
  print('Mini Game 1: Đoán Số');
  print('Xin chào bạn!');
  print('Chào mừng bạn đến với chương trình đoán số!');
  int randomNumber = Random().nextInt(100) + 1; // Số ngẫu nhiên từ 1 đến 100
  int attempts = 0;
  while (true) {
    stdout.write('Vui lòng nhập số bạn đoán (1-100): ');
    String? input = stdin.readLineSync();
    int? guess = int.tryParse(input ?? '');
    if (guess == null || guess < 1 || guess > 100) {
      print('Số không hợp lệ. Vui lòng nhập số từ 1 đến 100.');
      continue;
    }
    attempts++;
    if (guess < randomNumber) {
      print('Số bạn đoán quá thấp. Hãy thử lại!');
    } else if (guess > randomNumber) {
      print('Số bạn đoán quá cao. Hãy thử lại!');
    } else {
      print('Chúc mừng! Bạn đã đoán đúng số $randomNumber trong $attempts lần thử.');
      break;
    }
  }
}