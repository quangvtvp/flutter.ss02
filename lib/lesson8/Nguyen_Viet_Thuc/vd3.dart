void main() {
  Student student = Student("Nguyen Van A", 8.5);

  print("Học sinh: ${student.name}");
  print("Điểm: ${student.getGrade}");

  student.setGrade = 9.2;
  print("Điểm sau khi cập nhật: ${student.getGrade}");
}

class Student {
  String name;
  double _grade;

  Student(this.name, this._grade);

  set setGrade(double value) {
    if (value >= 0 && value <= 10) {
      _grade = value;
    } else {
      print("Giá trị điểm không hợp lệ. Vui lòng nhập điểm từ 0 đến 10.");
    }
  }

  double get getGrade {
    return _grade;
  }
}
