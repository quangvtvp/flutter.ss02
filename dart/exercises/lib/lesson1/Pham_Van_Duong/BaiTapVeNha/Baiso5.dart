void main() {
  double toan = 8.5, van = 7.25, anh = 9.0;
  double avg = (toan + van + anh) / 3;
  double gpa = avg / 2.5;
  String DiemChu = (avg >= 9)
      ? 'A'
      : (avg >= 8)
          ? 'B'
          : (avg >= 6.5)
              ? 'C'
              : (avg >= 4.0)
                  ? 'D'
                  : 'F';

  print('Diem TB: $avg,Diem GPA : $gpa, Diem chu: $DiemChu');
}
