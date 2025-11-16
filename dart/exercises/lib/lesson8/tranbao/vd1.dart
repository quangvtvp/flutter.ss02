class Student {
  String ten;
  double namsinh;
  Student(this.ten, this.namsinh);Student.withDefaultYear(this.ten) : namsinh = 2008;Student.withDefaultYear2(this.ten) : namsinh = 2009;
  void showInfo() {
    print('Tên: $ten, Năm sinh: $namsinh');
  }
}
void main() {
  Student hocsinh1 = Student.withDefaultYear('người thứ 1');Student hocsinh2 = Student.withDefaultYear2('người thứ 2');
  hocsinh1.showInfo();hocsinh2.showInfo();
}