void PrintStudentInfo() {
  var students = [
    {'name': 'An', 'age': 16, 'grade': 8.5},
    {'name': 'Bình', 'age': 17, 'grade': 7.8},
    {'name': 'Chi', 'age': 16, 'grade': 9.0},
  ];

  for (var s in students) {
    print('Tên: ${s['name']}, Tuổi: ${s['age']}, Điểm: ${s['grade']}');
  }
}

void main() {
  PrintStudentInfo();
}
