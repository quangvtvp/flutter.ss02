import 'dart:io';
import 'dart:math';

int generateRandomNumber() {
  Random random = Random();
  return random.nextInt(100) + 1;
}

int getPlayerGuess() {
  stdout.write("Nhập số bạn đoán (1-100): ");
  return int.parse(stdin.readLineSync()!);
}

bool checkGuess(int guess, int correctNumber) {
  if (guess < correctNumber) {
    print("Số bạn đoán nhỏ quá!");
    return false;
  } else if (guess > correctNumber) {
    print("Số bạn đoán lớn quá!");
    return false;
  } else {
    print(" Chính xác! Bạn đã đoán đúng số bí mật là $correctNumber.");
    return true;
  }
}

void startGame() {
  int secretNumber = generateRandomNumber();
  bool isCorrect = false;

  print("===== TRÒ CHƠI ĐOÁN SỐ (1–100) =====");

  while (!isCorrect) {
    int guess = getPlayerGuess();
    isCorrect = checkGuess(guess, secretNumber);
  }

  print("Cảm ơn bạn đã chơi!");
}

void main() {
  startGame();
}
