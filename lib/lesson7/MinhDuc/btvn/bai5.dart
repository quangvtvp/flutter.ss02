// Bài về nhà số 5: Bảng điểm học sinh (filter + multi-sort + top-K theo nhóm)
class Student {
  String name;
  int age;
  double grade;
  String classId;

  Student({required this.name, required this.age, required this.grade, required this.classId});

  void showInfo() {
    print('Tên: $name, Tuổi: $age, Điểm: $grade, Lớp: $classId');
  }
}

/// Lọc học sinh có grade >= 8.0 thuộc một classId nhập vào → sắp xếp grade ↓, name ↑.
List<Student> filterAndSortStudents(List<Student> students, String classId) {
  var filtered = students.where((s) => s.grade >= 8.0 && s.classId == classId).toList();
  filtered.sort((a, b) {
    int gradeComp = b.grade.compareTo(a.grade);
    if (gradeComp != 0) {
      return gradeComp;
    }
    return a.name.compareTo(b.name);
  });
  return filtered;
}

/// Tìm kiếm đa điều kiện: theo keyword (tên), minAge..maxAge, minGrade...maxGrade.
List<Student> searchStudents(List<Student> students, String keyword, int minAge, int maxAge, double minGrade, double maxGrade) {
  return students.where((s) =>
    s.name.toLowerCase().contains(keyword.toLowerCase()) &&
    s.age >= minAge && s.age <= maxAge &&
    s.grade >= minGrade && s.grade <= maxGrade
  ).toList();
}

/// Thống kê top K học sinh có điểm cao nhất trong mỗi lớp.
Map<String, List<Student>> topKStudentsByClass(List<Student> students, int k) {
  var classGroups = <String, List<Student>>{};
  for (var student in students) {
    classGroups.putIfAbsent(student.classId, () => []).add(student);
  }

  var topKByClass = <String, List<Student>>{};
  classGroups.forEach((classId, classStudents) {
    classStudents.sort((a, b) => b.grade.compareTo(a.grade));
    topKByClass[classId] = classStudents.take(k).toList();
  });
  return topKByClass;
}

void main() {
  var s1 = Student(name: 'Nguyễn Tuấn Minh', age: 16, grade: 9.1, classId: '11A1');
  var s2 = Student(name: 'Trần Anh Toàn', age: 16, grade: 8.5, classId: '11A2');
  var s3 = Student(name: 'Lê Viết Minh Đức', age: 15, grade: 8.6, classId: '11A2');
  var s4 = Student(name: 'Trần Thị Kim Ánh', age: 16, grade: 8.9, classId: '11A2');
  var s5 = Student(name: 'Phạm Minh Bảo', age: 16, grade: 9.2, classId: '11A1');
  var s6 = Student(name: 'Hà Thị Ngọc Hân', age: 16, grade: 9.2, classId: '11A1');
  var s7 = Student(name: 'Nguyễn Việt Cường', age: 16, grade: 8.8, classId: '11A2');
  var s8 = Student(name: 'Dương Đức Phương', age: 15, grade: 7.5, classId: '11A2');
  var s9 = Student(name: 'Lương Giang', age: 16, grade: 6.5, classId: '11A3');
  
  var students = [s1, s2, s3, s4, s5, s6, s7, s8, s9];
  
  print('Danh sách học sinh:');
  for (var student in students) {
    student.showInfo();
  }

  // Lọc học sinh có grade >= 8.0 thuộc một classId nhập vào → sắp xếp grade ↓, name ↑.
  print('\n--- Học sinh lớp 11A2 có điểm >= 8.0, sắp xếp theo điểm giảm dần, tên tăng dần: ---');
  var filteredSortedStudents = filterAndSortStudents(students, '11A2');
  for (var student in filteredSortedStudents) {
    student.showInfo();
  }

  // Tìm kiếm đa điều kiện: theo keyword (tên), minAge..maxAge, minGrade...maxGrade.
  print('\n--- Tìm kiếm học sinh theo từ khóa "Minh", tuổi từ 15 đến 16, điểm từ 8.0 đến 9.0: ---');
  var searchedStudents = searchStudents(students, 'Minh', 15, 16, 8.0, 9.0);
  for (var student in searchedStudents) {
    student.showInfo();
  }

  // Thống kê top 3 học sinh có điểm cao nhất trong mỗi lớp.
  print('\n--- Top 3 học sinh có điểm cao nhất trong mỗi lớp: ---');
  var topStudents = topKStudentsByClass(students, 3);
  topStudents.forEach((classId, studentsInClass) {
    print('Lớp $classId:');
    for (var student in studentsInClass) {
      student.showInfo();
    }
  });
}