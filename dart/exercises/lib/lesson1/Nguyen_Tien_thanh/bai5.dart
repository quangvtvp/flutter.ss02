void main() {
  double toan = 8.0;
  double ly = 7.5;
  double hoa = 9.0;
  double avg = (toan + ly + hoa) / 3;
  double gpa = avg / 2.5;
  String grade = gpa >= 3.6 ? "A" :
    gpa >= 3.2 ? "B" :
    gpa >= 2.5 ? "C" :
    gpa >= 2.0 ? "D" : "F";
  print("Điểm trung bình: $avg");
  print("GPA: $gpa");
  print("Xếp loại: $grade");
}
