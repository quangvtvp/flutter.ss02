class Rectangle {
  double? width;
  double? height;
  Rectangle({this.width, this.height});
  double area() {
    return width! * height!;
  }
}

void main() {
  var dientich = [];
  Rectangle r1 = Rectangle(width: 5, height: 10);
  Rectangle r2 = Rectangle(width: 6, height: 20);
  dientich.add(r1.area());
  dientich.add(r2.area());
  for (var i = 0; i < dientich.length; i++) {
    print('Dien tich hinh chu nhat ${i + 1} la: ${dientich[i]}');
  }
}
