void main() {
  double mon1 = 9.0;
  double mon2 = 9.0;
  double mon3 = 9.0;
  double avg = (mon1 + mon2 + mon3) / 3;
  double gpa = avg / 2.5;
  String grade = (gpa >= 3.6)
      ? "A"
      : (gpa >= 3.0)
          ? "B"
          : (gpa >= 2.0)
              ? "C"
              : (gpa >= 1.0)
                  ? "D"
                  : "F";
  print("Điểm trung bình: $avg");
  print("GPA: $gpa");
  print("Xếp loại: $grade");
}
