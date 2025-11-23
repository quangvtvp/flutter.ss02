import 'dart:io';

void guessword() {
  List<String> colours = [
    'red',
    'yellow',
    'green',
    'pink',
    'purple',
    'blue',
    'black',
    'orange',
    'white',
    'brown'
  ];
  colours.shuffle();
  String word = colours.first;
  while (true) {
    print('Guess the colour: ');
    String? guess = stdin.readLineSync();
    if (guess == word) {
      print('Correct!');
      break;
    } else {
      print('Wrong!');
    }
  }
}

Future<String> timer(int n) {
  print('Timer start ...');
  return Future.delayed(Duration(seconds: n), () {
    throw ("Time's up!");
  });
}

Future<void> main() async {
  print('Start the app');
  timer(10);
}
