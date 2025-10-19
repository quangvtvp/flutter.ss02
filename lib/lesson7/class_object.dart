main() {
  printStudentsUsingMap();
}

void printStudentsUsingMap() {
  var mapStudents = [
    {'name': 'Nguyen Van A', 'score': 8.0, 'gender': 'nam', 'class': '12A6'},
    {'name': 'Tran Thi B', 'score': 9.5, 'gender': 'nu', 'class': '12A6'},
    {'name': 'Le Van C', 'score': 7.0, 'gender': 'nam', 'class': '12A7'},
    {'name': 'Pham Thi D', 'score': 6.5, 'gender': 'nu', 'class': '11A6'},
  ];

  for (int i = 0; i < mapStudents.length; i++) {
    print('${i + 1}: ${mapStudents[i]['namee']} ${mapStudents[i]['clas']}');
  }
}

// khai báo danh sách các quyển sách bao gồm các thuộc tính: tác giả, môn học, tên sách, số trang
// dùng vòng for để in ra thông tin sách

void printStudentsUsingRecord() {
  var students = [
    ('Nguyen Van A', 8.0, 'nam', '12A6'),
    ('Tran Thi B', 9.5, 'nu', '12A6'),
    ('Le Van C', 7.0, 'nam', '12A7'),
    ('Pham Thi D', 6.5, 'nu', '11A6'),
  ];

  // khó khăn trong việc tìm kiếm variable/ property cần sử dụng
  for (int i = 0; i < students.length; i++) {
    print(
      '${i + 1}: ${students[i].$1} \t${students[i].$2} \t${students[i].$4}',
    );
  }
}
