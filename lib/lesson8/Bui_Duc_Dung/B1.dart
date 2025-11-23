void main() {
  Student hs1 = Student.k8("Nguyen Van A");
  Student hs2 = Student.k9("Tran Thi B");

  print("Học sinh 1: ${hs1.name}, Năm sinh: ${hs1.yearOfBirth}");
  print("Học sinh 2: ${hs2.name}, Năm sinh: ${hs2.yearOfBirth}");
}

class Student {
  String name;
  int yearOfBirth;

  Student(this.name, this.yearOfBirth);

  Student.k8(this.name) : yearOfBirth = 2008;

  Student.k9(this.name) : yearOfBirth = 2009;
}
