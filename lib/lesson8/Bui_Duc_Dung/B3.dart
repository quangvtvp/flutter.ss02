class Student {
  String name;
  double _grade;

  Student(this.name, this._grade);

  double get grade => _grade;

  set grade(double value) {
    if (value >= 0 && value <= 10) {
      _grade = value;
      print("✅ Đã cập nhật điểm: $_grade");
    } else {
      print("❌ Điểm phải từ 0 đến 10!");
    }
  }
}

void main() {
  var s = Student("Nguyen Van A", 8.0);

  print("${s.name} có điểm: ${s.grade}");

  s.grade = 9.5;
  s.grade = 12.0;
}
