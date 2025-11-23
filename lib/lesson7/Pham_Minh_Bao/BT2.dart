//Bài 2: Hình chữ nhật (cơ bản)
//Tạo class Rectangle có thuộc tính width, height.
//Viết phương thức area() để tính diện tích.
//Tạo đối tượng và in ra diện tích của từng hình.

import 'dart:io';

class hcn {
  double w;
  double h;

  hcn(this.w, this.h);

  void area() {
    print('diện tích hình chữ nhật có số đo $w và $h là \t${w * h}');
  }
}

void main() {
  print('nhập số lượng hình chữ nhật: ');
  int n = int.parse(stdin.readLineSync()!);

  List list = [];
  for (var i = 1; i <= n; i++) {
    print('nhập dữ liệu của hình chữ nhật thứ $i');
    stdout.write('Chiều dài: ');
    double w = double.parse(stdin.readLineSync()!);
    stdout.write('Chiều rộng: ');
    double h = double.parse(stdin.readLineSync()!);
    list.add(hcn(w, h));
  }

  print('Diện tích các hình chữ nhật là:');
  for (var i in list) {
    i.area();
  }
}
