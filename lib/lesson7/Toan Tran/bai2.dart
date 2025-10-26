//Bài 2: Hình chữ nhật.//
import 'dart:io';

class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);

  double area() {
    return width * height;
  }

  void showInfo() {
    print('Chiều rộng: $width | Chiều cao: $height | Diện tích: ${area()}');
  }
}

void main() {
  print('Nhập số lượng hình chữ nhật:');
  int n = int.parse(stdin.readLineSync()!);

  List<Rectangle> rectangles = [];

  for (int i = 0; i < n; i++) {
    print('\n--- Hình chữ nhật thứ ${i + 1} ---');
    stdout.write('Nhập chiều rộng: ');
    double width = double.parse(stdin.readLineSync()!);
    stdout.write('Nhập chiều cao: ');
    double height = double.parse(stdin.readLineSync()!);

    rectangles.add(Rectangle(width, height));
  }

  print('\n Danh sách các hình chữ nhật:');
  for (int i = 0; i < rectangles.length; i++) {
    print('\nHình thứ ${i + 1}:');
    rectangles[i].showInfo();
  }
}
