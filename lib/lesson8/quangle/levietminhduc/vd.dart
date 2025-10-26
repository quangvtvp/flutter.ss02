class Student {
  String name;
  int year;

  Student(this.name, this.year);
  Student.withDefaultYear(this.name) : year = 2008;
  Student.withDefaultYear2(this.name) : year = 2009;

  void showInfo() {
    print('Tên: $name, Năm sinh: $year');
  }
}
void main() {
  Student student1 = Student.withDefaultYear2('Minh Đức');
  Student student2 = Student.withDefaultYear2('Trần Toàn');
  Student student3 = Student.withDefaultYear('Việt Hoàng');

  student1.showInfo();
  student2.showInfo();
  student3.showInfo();
}