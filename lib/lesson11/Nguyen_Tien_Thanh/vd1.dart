import 'dart:io';
import 'dart:async';
void main(List<String> args) async {
   var result = await Future.any([timer(), guessWord()]);
    print(result);
  }
  Future<String> guessWord() async {
    List<String> colors = ['red', 'blue', 'green', 'yellow'];
    String secretColor = (colors..shuffle()).first;
    while (true) {
      print("Guess the color: ");
      String? userGuess =stdin.readLineSync();
      if (userGuess == secretColor) {
        return "You guessed the color $secretColor correctly!";
      } else {
        print("Wrong guess, try again.");
      }
    }
  }
  Future<String> timer() async {
    await Future.delayed(Duration(seconds: 10));
    return "Time's up! You took too long to guess the color.";
  }