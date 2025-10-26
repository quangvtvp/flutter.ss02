class Point {
  double x = 0;
  double y = 0;

  Point(this.x, this.y);

  Point.Origin() {
    x = 10;
    y = 10;
  }

}

void main() {
  var p = Point(10,20); // Gọi constructor mặc định

  var pOrigin = Point.Origin(); // Gọi constructor named

  print('x: ${p.x}, y: ${p.y}'); // x: 0, y: 0
  print('x1: ${pOrigin.x}, y1: ${pOrigin.y}'); // x: 0, y: 0

  var student = Student('quang', 2000);
 
}

//ten, namsinh

class Student {
  String name;
  int yearOfBirth;

  Student(this.name, this.yearOfBirth);

  // viết 2 hàm tạo mặc định cho năm sinh 2k8 và 2k9


}
