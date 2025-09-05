void main() {
  double toan = 9.5;
  double ly = 10;
  double hoa = 8.5;
  double tin = 9.25;
  double sinh = 9;
  print('Điểm toán: $toan; Điểm lý: $ly; Điểm hóa: $hoa; Điểm tin: $tin; Điểm sinh: $sinh;');
  List<double> diem = [toan, ly, hoa, tin, sinh];
  double tong = 0;
  for (int i = 0; i < diem.length; i++) {
    tong = tong + diem[i];
  }
  double TB = tong / diem.length;
  print('Điểm trung bình là: $TB');
}
