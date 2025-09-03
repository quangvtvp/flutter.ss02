void main() {
  double math = 9.4;
  double physics = 9.4;
  double english = 9.2;
  double average = (math + physics + english) / 3;
  double gpa = average / 2.5;
  String grade =
      (average >= 8.0)
          ? "A"
          : (gpa >= 7.0)
          ? "B"
          : (gpa >= 5.5)
          ? "C"
          : (gpa >= 4.0)
          ? "D"
          : "F";
  print("Điểm trung bình: ${average.toStringAsFixed(2)}");
  print("GPA: ${gpa.toStringAsFixed(2)}");
  print("Xếp loại: $grade");
}
