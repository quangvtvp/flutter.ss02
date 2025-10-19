import 'dart:io';
import 'dart:math';

void main() {
  startGame();
}

void startGame() {
  int secret = generateRandomNumber();
  bool correct = false;

  print('=== GAME ĐOÁN SỐ (1 - 100) ===');

  while (!correct) {
    int guess = getPlayerGuess();
    correct = checkGuess(guess, secret);
  }
}

int generateRandomNumber() {
  return Random().nextInt(100) + 1; // Tạo số ngẫu nhiên từ 1–100
}

int getPlayerGuess() {
  stdout.write('Nhập số bạn đoán: ');
  return int.parse(stdin.readLineSync()!);
}

bool checkGuess(int guess, int correctNumber) {
  if (guess < correctNumber) {
    print('Số bạn đoán nhỏ quá!');
    return false;
  } else if (guess > correctNumber) {
    print('Số bạn đoán lớn quá!');
    return false;
  } else {
    print('Chính xác! Bạn đã đoán đúng số bí mật là $correctNumber.');
    return true;
  }
}
