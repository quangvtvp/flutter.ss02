void main() {
  double diem1 = 9.4;
  double diem2 = 8.0;
  double diem3 = 7.5;
  double avg = (diem1 + diem2 + diem3) / 3;
  print('GPA: ${avg / 2.5}');
  if (avg >= 9.0) {
    print('Xếp loại: A');
  } else if (avg >= 8) {
    print('Học lực: B');
  } else if (avg >= 6.5) {
    print('Học lực: D');
  } else if (avg >= 5) {
    print('Học lực: E');
  } else {
    print('Học lực: F');
  }
}
