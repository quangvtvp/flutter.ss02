void main() {
  List<double> diem = [7.25, 8.75, 9, 9.5, 9.75];
  double tong = 0;
  for (int i = 0; i < 5; i++) {
    tong = tong + diem[i];
  }
  double TB = tong / 5;
  print('diem trung binh la: $TB');
}
