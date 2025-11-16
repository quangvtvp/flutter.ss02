List<int> Diem = [4, 5, 7, 9, 1, 3, 2];
void main() {
  int Max = Diem[0];
  int Min = Diem[0];
  for (int i = 0; i < Diem.length; i++) {
    if (Diem[i] > Max) {
      Max = Diem[i];
    }
    if (Diem[i] < Min) {
      Min = Diem[i];
    }
  }
  print('Điểm cao nhất là: $Max');
  print('Điểm thấp nhất là: $Min');
  Diem.add(6);
  double TB = 0;
  for (int i = 0; i < Diem.length; i++) {
    TB = Diem[i] + TB;
  }
  print('Điểm trung bình là: ${TB / Diem.length}');
}
