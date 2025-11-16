import 'dart:async';
import 'dart:io';

void main(List<String> args) async {
  // timer();
  var result = await Future.any([timer(), guessWord()]);
  print(result);
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
      print("Wrong! please try again.");
    }
  }
}

Future<String> timer() async {
  print("Timer started...");
  await Future.delayed(const Duration(seconds: 5));
  throw TimeoutException('Time has passed');
}

Future<void> main1(List<String> args) async {
  print('start the app');
  print('fetching the highest score student');
  var studentName = await getHighestScoreStudent();
  print('Highest score student: $studentName');
  print('do other work');
}

class Car {
  String model;
  int year;
  Car(this.model, this.year);
}

class Student {
  String name;
  int score;
  Student(this.name, this.score);
}

Future<String> getHighestScoreStudent() async {
  List<Student> students = [
    Student('Minh Bao', 9),
    Student('John Doe', 8),
    Student('Jane Smith', 10),
  ];
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    stdout.write('.');
  }
  print('Loading done 100%');
  students.sort((a, b) => b.score.compareTo(a.score));
  return students.first.name;
}

Future<void> processingImage() async {
  return Future.delayed(Duration(seconds: 15), () {
    print('Processed the Image');
  });
}

void fetchStudent() {
  print('Hello, Lesson 11!');
  print('getting the list of sutdents');
  Future.delayed(Duration(seconds: 15)).then((value) {
    print('Have the list of students');
    print('Showing the list of students on the screen');
  });
  print('Doing other work while waiting for the students list');
}
