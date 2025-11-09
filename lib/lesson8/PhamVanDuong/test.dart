class Student {
  String name;
  int yearOfBirth;

  // Constructor chính
  Student(this.name, this.yearOfBirth);

  // Hàm tạo mặc định cho năm 2008 và 2009
  Student.for2008({String name = 'Student2008'}) : this(name, 2008);
  Student.for2009({String name = 'Student2009'}) : this(name, 2009);
}

// Ví dụ sử dụng: tạo Student mặc định cho 2008/2009
void demoConstructors() {
  var s2008 = Student.for2008(name: 'Pham Van Duong');
  var s2009 = Student.for2009(name: 'Nguyen Van A');
  print('Tên: ${s2008.name} năm sinh: ${s2008.yearOfBirth}');
  print('Tên: ${s2009.name} năm sinh: ${s2009.yearOfBirth}');
}

void main() {
  demoConstructors();
}
