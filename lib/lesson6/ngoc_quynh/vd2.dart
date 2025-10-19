void main() {
  List<double> diem = [5, 7, 8, 9, 10];
  double max = diem[0];
  double min = diem[0];
  double tongdiem = 0;
  for (int i = 1; i < diem.length; i++) {
    if (diem[i] > max) {
      max = diem[i];
    }
  }
  for (int i = 1; i < diem.length; i++) {
    if (diem[i] < min) {
      min = diem[i];
    }
  }
  print('Diem cao nhat la: $max');
  print('Diem thap nhat la: $min');

  diem.add(9.5);
  print(' Diem ktra la: $diem');

  for (var so in diem) {
    tongdiem += so;
    double avg = tongdiem / diem.length;
    print('Diem trung binh la: $avg');
  }
}
