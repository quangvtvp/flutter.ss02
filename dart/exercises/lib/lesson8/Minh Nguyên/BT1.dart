class Student {
  String name;
  int yearofbirth;
  Student(this.name, this.yearofbirth);
  Student.k8(String name)
      : name = name,
        yearofbirth = 2008;

  Student.k9(String name)
      : name = name,
        yearofbirth = 2009;
  void information() {
    print('name: $name; year of birth: $yearofbirth');
  }
}

void main() {
  var student1 = Student.k9('minh nguyen');
  var student2 = Student.k8('nhi');
  student1.information();
  student2.information();
}
