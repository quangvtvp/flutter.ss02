//Bài về nhà số 2: Hình chữ nhật bằng class
class Rectangle {
  double length;
  double width;
  Rectangle({required this.length, required this.width});
  double area() {
    return length * width;
  }
  double perimeter() {
    return 2 * (length + width);
  }
  void showInfo() {
    print('Chiều dài: $length, Chiều rộng: $width, Diện tích: ${area()}, Chu vi: ${perimeter()}');
  }
}
void main() {
  var rectangles = <Rectangle>[];
  Rectangle rect1 = Rectangle(length: 5.0, width: 3.0);
  Rectangle rect2 = Rectangle(length: 7.5, width: 4.5);
  Rectangle rect3 = Rectangle(length: 10.0, width: 6.0);

  rectangles.add(rect1);
  rectangles.add(rect2);
  rectangles.add(rect3);

  for (var rect in rectangles) {
    rect.showInfo();
  }
}