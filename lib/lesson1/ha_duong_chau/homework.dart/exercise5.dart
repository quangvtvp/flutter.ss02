void main() {
  double math = 9.0, english = 8.5, physics = 8.0;
  double avg = (math + english + physics) / 3;
  double gpa = avg / 2.5;
  String grade = (avg >= 8.5)
      ? 'A'
      : (avg >= 7.0)
          ? 'B'
          : (avg >= 5.5)
              ? 'C'
              : (avg >= 4.0)
                  ? 'D'
                  : 'F';
  print(
      'Diem TB: ${avg.toStringAsFixed(2)}, GPA: ${gpa.toStringAsFixed(2)}, Diem chu: $grade');
}
