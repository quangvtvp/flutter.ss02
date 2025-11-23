import 'dart:io';
void main(List<String> args) async {
  try {
    var result = await Future.any(futures);
    print(result);
  } catch (e) {
    print(e);
  }
}
void guessWord() {
  List<String> colors = ['red', 'blue', 'green', 'yellow', 'orange'];
  String selectedColor = (colors..shuffle()).first;
  while (true) {
    stdout.write('Guess the color: ');
    String? userGuess = stdin.readLineSync();
    if (userGuess == null) {
      print('Please enter a valid color.');
      continue;
    }
    if (userGuess.toLowerCase() == selectedColor) {
      print('Congratulations! You guessed it right.');
      break;
    } else {
      print('Wrong guess. Try again!');
    }
  }
}
Future<String> timer() {
  return Future.delayed(Duration(seconds: 10), () {
     if (true) {
      throw 'Timer completed without a correct guess.';
    }
  });
}
Future<String> guessWordFuture() {
  return Future(() {
    guessWord();
    return 'User guessed the correct color!';
  });
}
List<Future<String>> futures = [
    timer(),
    guessWordFuture(),
];
