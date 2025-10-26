void main() {
  Student student1 = Student.k8("Nguyen Van A");
  Student student2 = Student.k9("Tran Thi B");

  print(
      "Student 1: Tên = ${student1.name}, Năm sinh = ${student1.yearOfBirth}");
  print(
      "Student 2: Tên = ${student2.name}, Năm sinh = ${student2.yearOfBirth}");
}

class Student {
  String? name;
  int? yearOfBirth;

  Student(this.name, this.yearOfBirth);

  Student.k8(String name) {
    this.name = name;
    yearOfBirth = 2008;
  }

  Student.k9(String name) {
    this.name = name;
    yearOfBirth = 2009;
  }
}
