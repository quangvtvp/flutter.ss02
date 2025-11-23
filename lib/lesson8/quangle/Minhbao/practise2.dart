import 'dart:io';

void main() {
  int answer = 130829;
  bool loop = true;
  do {
    stdout.write('Please enter your guess (6-digit number): ');
    int? input = int.tryParse(stdin.readLineSync() ?? '');
    if (input == null || input < 100000 || input > 999999) {
      print(
          'Sorry, your entered value is invalid. Please enter a 6-digit number!');
      continue;
    } else {
      if (input == answer) {
        print('Congratulations! You guessed the correct number: $answer');
        loop = false;
      } else if (input < answer) {
        print('your guessed number is too low, Try a higher number');
        continue;
      } else if (input > answer) {
        print('Your guessed number is too high, Try a lower number');
        continue;
      }
    }
  } while (loop);
}
