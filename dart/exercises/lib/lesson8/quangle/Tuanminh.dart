class Student {
  String name;
  int yearbirth;

  Student(this.name, this.yearbirth);

  Student.origin(this.name) : yearbirth = 2008;

  Student.origin1(this.name) : yearbirth = 2009;
}

void main() {
  var student = Student.origin("minh");
  print(student.name);
  print(student.yearbirth);
}
