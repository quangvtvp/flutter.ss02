// Bài về nhà số 5
void main() {
  print('Exercise 5:');
  double toan = 9.3, ly = 9.2, hoa = 8.5;
  double avg = (toan + ly + hoa) / 3;
  print('Điểm trung bình là: $avg');
  double GPA = avg / 2.5;
  print('Điểm GPA là: $GPA');
  String diemChu = (GPA >= 4.0)
      ? 'A+'
      : (GPA >= 3.6)
          ? 'A'
          : (GPA >= 3.2)
              ? 'B+'
              : (GPA >= 3.0)
                  ? 'B'
                  : (GPA >= 2.8)
                      ? 'C+'
                      : (GPA >= 2.5)
                          ? 'C'
                          : (GPA >= 2.0)
                              ? 'D+'
                              : (GPA >= 1.5)
                                  ? 'D'
                                  : (GPA >= 1.0)
                                      ? 'E'
                                      : 'F';
  print('Xếp loại là: $diemChu');
}
