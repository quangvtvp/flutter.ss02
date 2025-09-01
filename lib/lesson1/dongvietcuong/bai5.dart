void main() {
  double math = 9, english = 7.3, literature = 5.5;
  double avg = (math + english + literature) / 3;
  double gpa = avg / 2.5;
  String grade;
   if (avg >= 8) {
    grade = "A";
  } else if (avg >= 6.5) {
    grade = "B";
  } else if (avg >= 5) {
    grade = "C";
  } else if (avg >= 3.5) {
    grade = "D";
  } else {
    grade = "F";
  }
   print('Điểm TB:  ${avg.toStringAsFixed(2)}, GPA: ${gpa.toStringAsFixed(2)}, Điểm chữ: $grade');
}
