class Student {
  String name;
  double _grade;
  Student(this.name, this._grade);
  double get grade => _grade;
  set grade(double value) {
    if (value < 0 || value > 10) {
      print('Điểm không hợp lệ! Điểm phải từ 0 đến 10.');
    } else {
      _grade = value;
    }
  }
}

void main() {
  var student = Student('Lê Viết Minh Đức', 9.0);
  print('Tên học sinh: ${student.name}');
  print('Điểm: ${student.grade}');
  student.grade = 12.0;
  print('Điểm sau khi đặt không hợp lệ: ${student.grade}');
  student.grade = 8.5;
  print('Điểm sau khi đặt hợp lệ: ${student.grade}');
}
