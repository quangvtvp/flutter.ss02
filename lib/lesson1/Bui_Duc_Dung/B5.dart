void main() {
  double Toan = 9.6, Ly = 9.4, Hoa = 9.8;

  double avg = (Toan + Ly + Hoa) / 3;
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
      'Điểm trung bình: ${avg.toStringAsFixed(2)}, GPA: ${gpa.toStringAsFixed(2)}, Xếp loại: $grade');
}
