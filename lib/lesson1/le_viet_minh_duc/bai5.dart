//Bài về nhà số 5
void main() {
  print('Exercise 5:');
  double toan = 9.3, ly = 9.2, hoa = 8.5;
  double avg = (toan + ly + hoa) / 3;
  double gpa = avg / 2.5;
  String grade = (gpa == 4.0)
      ? 'A+'
      : (gpa >= 3.6)
          ? 'A'
          : (gpa >= 2.8)
              ? 'B'
              : (gpa >= 2.5)
                  ? 'C+'
                  : (gpa >= 2.0)
                      ? 'C'
                      : (gpa >= 1.5)
                          ? 'D+'
                          : (gpa >= 1.0)
                              ? 'D'
                              : 'F';
  print('Điểm TB = $avg; GPA = $gpa; Điểm chữ = $grade');
}
