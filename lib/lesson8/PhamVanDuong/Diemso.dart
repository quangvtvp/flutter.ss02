class Student {
  String name;
  double _grade;

  Student(this.name, this._grade);

  double get grade => _grade;
  set grade(double value) {
    if (value < 0 || value > 10) {
      print('Điểm không hợp lệ, phải từ 0 đến 10');
    } else {
      _grade = value;
    }
  }
}

void main() {
  Student student = Student('Pham Van Duong', 8.5);
  print('Tên: ${student.name}, Điểm: ${student.grade}');
}
