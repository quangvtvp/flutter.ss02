import 'dart:io';

void main() {
  String answer = 'PENGUIN';
  List<String> chars = answer.split('');
  chars.shuffle();
  String scrambled = chars.join('');
  bool loop = true;
  do {
    print('Guess the word: $scrambled');
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty) {
      print('Please enter a valid word!');
      continue;
    } else {
      if (input.toUpperCase() == answer) {
        print('Congratulations! You guessed the correct word: $answer');
        loop = false;
      } else {
        print('Wrong guess! Try again.');
      }
    }
  } while (loop);
}
