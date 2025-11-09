class Student {
  String name;
  int age;
  double grade;

  // Constructor
  Student({
    required this.name,
    required this.age,
    required this.grade,
  });

  // Phương thức in thông tin học sinh
  void showInfo() {
    print('Tên: $name, Tuổi: $age, Điểm: $grade');
  }

  // Phương thức kiểm tra học sinh giỏi
  bool isExcellent() {
    return grade >= 8;
  }
}

void main() {
  // Tạo danh sách học sinh
  var students = <Student>[];
  Student student1 = Student(
    name: 'An',
    age: 16,
    grade: 9.0,
  );
  Student student2 = Student(
    name: 'Bình',
    age: 15,
    grade: 7.5,
  );
  Student student3 = Student(
    name: 'Chi',
    age: 17,
    grade: 8.5,
  );
  Student student4 = Student(
    name: 'Dũng',
    age: 16,
    grade: 6.8,
  );
  Student student5 = Student(
    name: 'Lan',
    age: 15,
    grade: 9.2,
  );

  students.addAll([student1, student2, student3, student4, student5]);
  print('--- Danh sách học sinh ---');
  for (var s in students) {
    s.showInfo();
  }
  print('\n--- Học sinh giỏi (grade >= 8) ---');
  for (var s in students.where((s) => s.isExcellent())) {
    s.showInfo();
  }
}
