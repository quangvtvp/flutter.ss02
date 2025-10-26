class Point {
  int? year;
  Point(this.year1, this.year2);
  var year1 = 0;
  var year2 = 0;
}

class Point1 {
  var name1 = '';
  var name2 = '';
  Point1(this.name1, this.name2);
}

void main() {
  var p = Point(2008, 2009);
  var name = Point1('Ngoc Quynh', 'A');

  print('Ten: ${name.name1}, Nam sinh: ${p.year1}');
  print('Ten: ${name.name2}, Nam sinh: ${p.year2}');
}
