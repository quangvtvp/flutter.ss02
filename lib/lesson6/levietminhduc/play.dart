import 'dart:io';
import 'dart:math';
void main() {
  print('Chào mừng đến với trò chơi đoán từ!');
  play('Chào mừng đến với trò chơi đoán từ!');
}
void play(String welcomeMessage) {
  String? randomWord;
  Random random = Random();
  print(welcomeMessage);
  String wordToGuess = 'apple'; // Từ cần đoán
  String hiddenWord = '_' * wordToGuess.length; // Hiển thị dưới dạng gạch chân
  int attempts = 15;
  Set<String> guessedLetters = {};

  while (attempts > 0 && hiddenWord.contains('_')) {
    print('Từ hiện tại: $hiddenWord');
    print('Bạn còn $attempts lượt đoán.');
    stdout.write('Nhập một chữ cái: ');
    String? input = stdin.readLineSync();
    if (input == null || input.length != 1) {
      print('Vui lòng nhập đúng một chữ cái.');
      continue;
    }
    String letter = input.toLowerCase();
    if (guessedLetters.contains(letter)) {
      print('Bạn đã đoán chữ cái này rồi. Hãy thử chữ khác.');
      continue;
    }
    guessedLetters.add(letter);
    if (wordToGuess.contains(letter)) {
      print('Chính xác! Chữ cái "$letter" có trong từ.');
      for (int i = 0; i < wordToGuess.length; i++) {
        if (wordToGuess[i] == letter) {
          hiddenWord = hiddenWord.substring(0, i) + letter + hiddenWord.substring(i + 1);
        }
      }
    } else {
      attempts--;
      print('Sai rồi! Chữ cái "$letter" không có trong từ.');
    }
  }

  if (!hiddenWord.contains('_')) {
    print('Chúc mừng! Bạn đã đoán đúng từ: $wordToGuess');
  } else {
    print('Hết lượt đoán! Từ đúng là: $wordToGuess');
  }
}