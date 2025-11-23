//thuộc tính: name, age, grade
//Phương thức: showInfo(), isExcellent()
//In ra danh sách học sinh và những học sinh giỏi (grade >= 8)

class Student {
  String name;
  int age;
  int grade;

  Student(this.name, this.age, this.grade); // yeu cầu nhập đầy đủ thông tin

  void showInfo() {
    print('Name: $name \tAge: $age \tGrade: $grade');
  }

  bool isExcellent() => grade >= 8;
}

void main() {
  List<Student> students = [
    Student('An', 16, 9),
    Student('Binh', 17, 7),
    Student('Chi', 16, 8),
    Student('Dung', 17, 6)
  ];
  print('_____Danh sách học sinh_____');
  for (var student in students) {
    student.showInfo();
  }
  print('_____Học sinh giỏi_____');
  for (var student in students) {
    if (student.isExcellent()) student.showInfo();
  }
}
