class Student {
  String? name;
  int? age;
  double? grade;
  Student({this.name, this.age, this.grade});
  void showInfo() {
    print('Ten: $name, Tuoi: $age, Diem: $grade');
  }
}

void main() {
  var students = [];
  Student student1 = Student(name: 'A', age: 16, grade: 8.5);
  Student student2 = Student(name: 'B', age: 17, grade: 9.0);
  students.add(student1);
  students.add(student2);
  for (var student in students) {
    student.showInfo();
  }
  var gioi = [];
  for (var student in students) {
    if (student.grade >= 8.0) {
      gioi.add(student.name);
    }
  }
  print('Hoc sinh gioi: ');
  print(gioi);
}
