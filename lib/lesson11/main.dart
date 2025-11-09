Future<void> main(List<String> args) async {
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

Future<String> getLatestModel() async {}

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
  return Future.delayed(Duration(seconds: 15), () {
    students.sort((a, b) => b.score.compareTo(a.score));
    return students.first.name;
  });
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
