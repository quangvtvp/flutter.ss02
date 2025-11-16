import 'dart:io';
import 'dart:math';

void main() {
  startGame();
}

void startGame() {
  print("Chào mừng bạn đến với trò chơi đoán số (1 - 100)!");
  int secretNumber = generateRandomNumber();
  bool isCorrect = false;

  while (!isCorrect) {
    int guess = getPlayerGuess();
    isCorrect = checkGuess(guess, secretNumber);
  }

  print("Kết thúc trò chơi. Cảm ơn bạn đã chơi!");
}

int generateRandomNumber() {
  Random random = Random();
  return random.nextInt(100) + 1;
}

int getPlayerGuess() {
  stdout.write("Nhập số bạn đoán (1 - 100): ");
  String? input = stdin.readLineSync();

  // kiểm tra hợp lệ
  if (input == null || input.isEmpty) {
    print("Vui lòng nhập một số hợp lệ!");
    return getPlayerGuess();
  }

  int? guess = int.tryParse(input);
  if (guess == null || guess < 1 || guess > 100) {
    print("Số không hợp lệ, vui lòng nhập lại (1 - 100).");
    return getPlayerGuess();
  }

  return guess;
}

bool checkGuess(int guess, int correctNumber) {
  if (guess < correctNumber) {
    print("Số bạn đoán nhỏ quá!");
    return false;
  } else if (guess > correctNumber) {
    print("Số bạn đoán lớn quá!");
    return false;
  } else {
    print("Chính xác! Bạn đã đoán đúng số bí mật là $correctNumber.");
    return true;
  }
}
