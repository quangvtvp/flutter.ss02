import 'dart:io';

void main() async {
  try {
    var result = await Future.any([timer(), guessWord()]);
    print(result);
  } catch (e) {
    print(e);
  }
}

Future<String> guessWord() async {
  List<String> colour = ['red', 'blue', 'green', 'yellow', 'purple'];
  String secretColour = (colour..shuffle()).first;
  while (true) {
    print("Guess the colour:");
    String? userguess = stdin.readLineSync();
    if (userguess == secretColour) {
      print("You guessed right! the colour is $secretColour");
      return "You won! The color was $secretColour";
    } else {
      print("Try again!");
    }
  }
}

Future<String> timer() async {
  print("timer started...");
  await Future.delayed(Duration(seconds: 20));
  return "time's up";
}
