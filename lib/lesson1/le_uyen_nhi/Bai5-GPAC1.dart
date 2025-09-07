void main() {
  double math = 9.8, physics = 9.8, chemistry = 9.6;

  double avg = (math + physics + chemistry) / 3;
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
      'Điểm TB: ${avg.toStringAsFixed(2)}, GPA: ${gpa.toStringAsFixed(2)}, Điểm chữ: $grade');
}
