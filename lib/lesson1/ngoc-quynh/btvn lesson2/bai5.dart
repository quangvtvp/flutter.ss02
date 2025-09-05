void main() {
  double math = 9.7, literature = 7.0, english = 8.0;
  double avg = (math + literature + english) / 3;
  double gpa = avg / 2.5;
  String grade = (avg >= 8.0)
      ? "A"
      : (avg >= 7.5)
          ? 'B'
          : (avg >= 7.0)
              ? 'C'
              : (avg >= 6.5)
                  ? 'D'
                  : 'F';
  print(' Môn Toán: $math, Môn Văn: $literature, Môn Anh: $english');
  print('Điểm TB: $avg, GPA: $gpa, Điểm quy đổi: $grade');
}
