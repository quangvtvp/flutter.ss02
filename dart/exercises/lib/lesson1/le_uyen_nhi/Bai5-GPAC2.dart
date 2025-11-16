void main() {
  List<double> diem = [9.8, 9.6, 9.8];
  double avg = (diem[0] + diem[1] + diem[2]) / 3;
  double GPA = avg / 2.5;
  String diemchu = (GPA >= 3.6)
      ? 'A'
      : (GPA >= 2.8)
          ? 'B'
          : (GPA >= 1.9)
              ? 'C'
              : (GPA >= 1.0)
                  ? 'D'
                  : 'F';
  print('Điểm trung bình: $avg');
  print('GPA: $GPA');
  print('Điểm chữ: $diemchu');
}
