class Student {
  String name;
  int age;
  double grade;
  Student(this.name, this.age, this.grade);
  void information() {
    print('Name: $name; Age: $age; Grade: $grade');
  }
}

void main() {
  var student1 = Student('minh nguyen', 16, 9.5);
  var student2 = Student('nhi', 15, 10.0);
  student1.information();
  student2.information();
}
