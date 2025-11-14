import 'dart:io';

Future<void> main(List<String> args) async {
  try {
    var result = await Future.any([timer(), guessWord()]);
    print(result);
  } catch (e) {
    print(e);
  }
}

Future<String> timer() async {
  print("Timer started...");
  await Future.delayed(Duration(seconds: 2), () {
    throw Exception("Time's up!");
  });
}

Future<String> guessWord() async {
  List<String> colors = ['red', 'blue', 'green', 'yellow', 'purple'];
  String secretColor = (colors..shuffle()).first;
  while (true) {
    print("Guess the color: ");
    String? userGuess = stdin.readLineSync();
    if (userGuess == secretColor) {
      return "Correct! The color was $secretColor.";
    } else {
      return "Wrong! please try again.";
    }
  }
}

Future<void> orderProgram() async {
  print("ordering the food...");
  String order = await foodOrder();
  print("doing other things...");
}

Future<String> foodOrder() {
  return Future.delayed(Duration(seconds: 3), () {
    return "Burger";
  });
}

Future<List<String>> loadStudent() async {
  print("Start loading student list...");
  List<String> students = [];
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1), () {});
    stdout.write(".");
    students.add("Student ${i + 1}");
  }
  print("\nStudent list loaded!");
  return students;
}
